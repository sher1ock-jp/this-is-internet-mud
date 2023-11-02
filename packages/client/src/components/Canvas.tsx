import React, { useEffect, useState, useRef, memo } from 'react';
import { MAP_SIZE, TILE_SIZE, CHAINS } from '../constants';
import { useMUD } from "../MUDContext";
import { 
  HasValue,
  runQuery,
  getComponentValue,
} from "@latticexyz/recs";

interface CanvasProps {
    pixelColors: string[][];
    handlePixelUpdate: (id: number) => void; 
    setSelectedChainName: React.Dispatch<React.SetStateAction<string | null>>;
    selectedChainName: string | null;
    setSelectedChainId: React.Dispatch<React.SetStateAction<string>>;
    selectedChainId: string;
    setSelectedLandId: React.Dispatch<React.SetStateAction<number>>;
    selectedLandId: number;
    canvasMode: "INPUT" | "VIEW";
}

const Canvas = ({ 
    pixelColors, handlePixelUpdate, 
    setSelectedChainName,
    selectedChainId, setSelectedChainId,
    selectedLandId, setSelectedLandId,
    canvasMode,
}: CanvasProps) => {

    const { components: { Pixel },} = useMUD();    
    
    const canvasRef = useRef<HTMLCanvasElement | null>(null);
    const pixelInfoRef = useRef<HTMLDivElement | null>(null);
    const [hoveredPixel, setHoveredPixel] = useState<{ data: {connectedChainId: string, connectedLandId: number, connectedPixelId: number}} | null>(null);
    const [connectedChainId, setConnectedChainId] = useState<string>('');
    const [connectedLandId, setConnectedLandId] = useState<number>(0);
    const [connectedPixelId, setConnectedPixelId] = useState<number>(0);

    useEffect(() => {
        const ctx = canvasRef.current?.getContext('2d');
        if (ctx) {
            for (let x = 0; x < MAP_SIZE; x++) {
                for (let y = 0; y < MAP_SIZE; y++) {
                    paintPixel(ctx, x, y, pixelColors[y][x]);
                }
            }   
        }
    }, [pixelColors]);

    useEffect(() => {
        document.addEventListener("mousedown", handlePixelInfo);
        return () => {
            document.removeEventListener("mousedown", handlePixelInfo);
        };
    }, []);

    const paintPixel = (ctx: CanvasRenderingContext2D, pixelX: number, pixelY: number, color: string) => {
        ctx.fillStyle = color;
        ctx.fillRect(pixelX * TILE_SIZE, pixelY * TILE_SIZE, TILE_SIZE, TILE_SIZE);
        ctx.strokeRect(pixelX * TILE_SIZE, pixelY * TILE_SIZE, TILE_SIZE, TILE_SIZE);
    };

    const convertXYToPixelId = (x: number, y: number) => y * MAP_SIZE + x;

    const onCanvasClicked = (e: React.MouseEvent<HTMLCanvasElement>) => {
        const rect = canvasRef.current?.getBoundingClientRect();
        if (rect) {
            const x = Math.floor((e.clientX - rect.left) / TILE_SIZE);
            const y = Math.floor((e.clientY - rect.top) / TILE_SIZE);

            if (x >= 0 && x < MAP_SIZE && y >= 0 && y < MAP_SIZE) {
                if(canvasMode === "INPUT") {
                    handlePixelUpdate(convertXYToPixelId(x, y));
                } else { 
                    const pixelId = convertXYToPixelId(x, y);
                    const pixelEntity = runQuery([HasValue(Pixel, { chainID: Number(selectedChainId), landID: selectedLandId, pixelID: pixelId })]);
                    
                    const pixelData = [...pixelEntity].map(entity => getComponentValue(Pixel, entity)).filter(Boolean) as any[];
                    if (pixelData.length) {
                        const data = pixelData[0];
                        setConnectedChainId(data.connectedChainId);
                        setConnectedLandId(data.connectedLandId);
                        setConnectedPixelId(data.connectedPixelId);
                        setHoveredPixel({
                            data: {
                                connectedChainId: connectedChainId,
                                connectedLandId: connectedLandId,
                                connectedPixelId: connectedPixelId,
                            },
                        });
                    }
                }
            }
        }
    };

    const handlePixelInfo = (e: MouseEvent) => {
        if (pixelInfoRef.current && !pixelInfoRef.current.contains(e.target as Node)) {
            setHoveredPixel(null);
        }
    };

    const moveToSelectedPixel = () => {
        if (!hoveredPixel) {
            console.log("No pixel selected");
            return;
        }
        const chain_name = CHAINS.find(chain => Number(hoveredPixel.data.connectedChainId) === chain.id_for_contract);
        setSelectedChainName(chain_name?.name || null);
        setSelectedChainId(hoveredPixel.data.connectedChainId);
        setSelectedLandId(hoveredPixel.data.connectedLandId);
        setHoveredPixel(null);
    }

    return (
        <>
            <canvas 
                ref={canvasRef} 
                width={MAP_SIZE * TILE_SIZE} 
                height={MAP_SIZE * TILE_SIZE} 
                onClick={onCanvasClicked} 
                className="canvas"
            />
             {hoveredPixel && 
                <div className="pixel-info" ref={pixelInfoRef}>
                    <p>move to connected address?</p>
                    <p>ChainId: {hoveredPixel.data.connectedChainId}</p>
                    <button onClick={moveToSelectedPixel}>Move</button>
                </div>
            }
        </>
    );
}

export default memo(Canvas);
