import React, { useEffect, useRef, memo } from 'react';
import { MAP_SIZE, TILE_SIZE } from '../constants';
import ChainLandContext from '../ChainLandContext';
import { useMUD } from "../MUDContext";
import { 
  HasValue,
  runQuery,
  getComponentValue,
  Has,
} from "@latticexyz/recs";

interface CanvasProps {
    tileColors: string[][];
    onTileClick: (id: number) => void;  // callback when a specific tile is clicked
}

const Canvas = ({ tileColors, onTileClick }: CanvasProps) => {
    const context = React.useContext(ChainLandContext);
    if (!context) { throw new Error('LandSelector must be used within a ChainLandContext.Provider');}
    const { chainId, landId } = context;
    
    const { components: { Pixel },} = useMUD();
    const canvasRef = useRef<HTMLCanvasElement | null>(null);

    // const _chaindId = parseInt(chainId, 16);
    // console.log(_chaindId, landId);
    console.log("query result",runQuery([HasValue(Pixel, { chainID: Number(chainId), landID: landId })]));

    const drawTile = (ctx: CanvasRenderingContext2D, x: number, y: number, color: string) => {
        ctx.fillStyle = color;
        ctx.fillRect(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE);
        ctx.strokeStyle = 'lightgray';  // Outline color
        ctx.strokeRect(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE);
    };

    useEffect(() => {
        const ctx = canvasRef.current?.getContext('2d');
        if (ctx) {
            for (let x = 0; x < MAP_SIZE; x++) {
                for (let y = 0; y < MAP_SIZE; y++) {
                    drawTile(ctx, x, y, tileColors[y][x]);
                }
            }   
        }
    }, [tileColors]); 

    const xyToId = (x: number, y: number) => y * MAP_SIZE + x;

    const handleCanvasClick = (e: React.MouseEvent<HTMLCanvasElement>) => {
        const rect = canvasRef.current?.getBoundingClientRect();
        if (rect) {
            const x = Math.floor((e.clientX - rect.left) / TILE_SIZE);
            const y = Math.floor((e.clientY - rect.top) / TILE_SIZE);

            if (x >= 0 && x < MAP_SIZE && y >= 0 && y < MAP_SIZE) {
                onTileClick(xyToId(x, y));
            }
        }
    };

    return (
        <div className="pixel-area">
            <canvas 
            ref={canvasRef} 
            width={MAP_SIZE * TILE_SIZE} 
            height={MAP_SIZE * TILE_SIZE} 
            onClick={handleCanvasClick} 
            className="canvas"
            />
        </div>
    );
}

export default memo(Canvas); // using memo to prevent unnecessary re-renders
