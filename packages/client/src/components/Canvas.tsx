import React, { useEffect, useRef, memo } from 'react';
import { MAP_SIZE, TILE_SIZE } from '../constants';

interface CanvasProps {
  tileColors: string[][];
  onTileClick: (x: number, y: number) => void;
}

const Canvas: React.FC<CanvasProps> = ({ tileColors, onTileClick }) => {
    const canvasRef = useRef<HTMLCanvasElement | null>(null);

    const drawTile = (ctx: CanvasRenderingContext2D, x: number, y: number, color: string) => {
        ctx.fillStyle = color;
        ctx.fillRect(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE);
        ctx.strokeStyle = 'lightgray';
        ctx.strokeRect(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE);
    };

    const drawInitialTile = (ctx: CanvasRenderingContext2D, x: number, y: number) => {
        const baseColor = "#2C3E50"; 
        ctx.fillStyle = baseColor;
        ctx.fillRect(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE);

        if (Math.random() > 0.8) {
            ctx.strokeStyle = "#34495E";
            ctx.beginPath();
            if (Math.random() > 0.5) {
                ctx.arc(x * TILE_SIZE + Math.random() * TILE_SIZE, y * TILE_SIZE + Math.random() * TILE_SIZE, 1, 0, 2 * Math.PI);
            } else {
                const startX = x * TILE_SIZE + Math.random() * TILE_SIZE;
                const startY = y * TILE_SIZE + Math.random() * TILE_SIZE;
                const endX = x * TILE_SIZE + Math.random() * TILE_SIZE;
                const endY = y * TILE_SIZE + Math.random() * TILE_SIZE;
                ctx.moveTo(startX, startY);
                ctx.lineTo(endX, endY);
            }
            ctx.stroke();   
        }
        ctx.strokeStyle = 'lightgray';
        ctx.strokeRect(x * TILE_SIZE, y * TILE_SIZE, TILE_SIZE, TILE_SIZE);
    };

    const drawBackground = (ctx: CanvasRenderingContext2D) => {
        ctx.fillStyle = 'black';
        ctx.fillRect(0, 0, MAP_SIZE * TILE_SIZE, MAP_SIZE * TILE_SIZE);
        for (let i = 0; i < 500; i++) {
            const x = Math.random() * MAP_SIZE * TILE_SIZE;
            const y = Math.random() * MAP_SIZE * TILE_SIZE;
            ctx.fillStyle = 'white';
            ctx.fillRect(x, y, 1, 1);
        }
    };

    useEffect(() => {
        const ctx = canvasRef.current?.getContext('2d');
        if (ctx) {
            if (!ctx.canvas.style.background) {
                drawBackground(ctx);
                ctx.canvas.style.background = ctx.canvas.toDataURL();
            }
            for (let x = 0; x < MAP_SIZE; x++) {
                for (let y = 0; y < MAP_SIZE; y++) {
                    if (tileColors[y][x] === 'white') {
                        drawInitialTile(ctx, x, y);
                    } else {
                        drawTile(ctx, x, y, tileColors[y][x]);
                    }
                }
            }   
        }
    }, [tileColors]);

    const handleCanvasClick = (e: React.MouseEvent<HTMLCanvasElement>) => {
        const rect = canvasRef.current?.getBoundingClientRect();
        if (rect) {
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            const tileX = Math.floor(x / TILE_SIZE);
            const tileY = Math.floor(y / TILE_SIZE);
        
            if (tileX >= 0 && tileX < MAP_SIZE && tileY >= 0 && tileY < MAP_SIZE) {
                onTileClick(tileX, tileY);
            }
        }
    };

    return (
        <canvas 
          ref={canvasRef} 
          width={MAP_SIZE * TILE_SIZE} 
          height={MAP_SIZE * TILE_SIZE} 
          onClick={handleCanvasClick} 
          className="canvas"
        />
    );
}

export default memo(Canvas);
