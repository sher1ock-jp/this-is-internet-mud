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
    if (!context) {
    throw new Error('LandSelector must be used within a ChainLandContext.Provider');
    }
    const { chainId, landId } = context;
    
    const { components: { Pixel },} = useMUD();
    // console.log("クエリ結aaa果",runQuery([HasValue(Pixel,{pixelId:1})]));
    // HasValue(SquareCoordinates, { x: coordinateX, y: coordinateY }

    const canvasRef = useRef<HTMLCanvasElement | null>(null);

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

    const xyToId = (x: number, y: number) => {
        return y * MAP_SIZE + x;
    }

    const handleCanvasClick = (e: React.MouseEvent<HTMLCanvasElement>) => {
        const rect = canvasRef.current?.getBoundingClientRect(); // get canvas position
        if (rect) {
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            const tileX = Math.floor(x / TILE_SIZE);
            const tileY = Math.floor(y / TILE_SIZE);
            
            const pixelId = xyToId(tileX, tileY);

            // check if clicked position is within the map boundaries
            if (tileX >= 0 && tileX < MAP_SIZE && tileY >= 0 && tileY < MAP_SIZE) {
                onTileClick(pixelId);
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
