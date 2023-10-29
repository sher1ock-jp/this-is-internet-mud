import { useState } from 'react';
import { MAP_SIZE, TILE_SIZE, PRESETCOLORS } from './constants';
import './App.css';
import Canvas from './components/Canvas'; 
import WalletConnect from './components/WalletConnect';
import LandSelector from './components/LandSelector';
import PixelInfoForm, {PixelInfo} from './components/PixelInfoForm';

import { useMUD } from "./MUDContext";

import { 
  HasValue,
  runQuery,
  getComponentValue,
  Has,
} from "@latticexyz/recs";

// Utility function to initialize a 2D array (representing the map/grid)
const initializeTileColors = () => {
  return Array.from({ length: MAP_SIZE }, () => Array(MAP_SIZE).fill('white'));
};

const App = () => {

  const {
    components: {
      ChainComponent,
      Pixel
    },
  } = useMUD();

  console.log("クエリ結果",runQuery([HasValue(ChainComponent, { landCount: 1 })]));
  console.log("クエリ結aaa果",runQuery([Has(Pixel)]));

  // pallette color for drawing
  const [currentColor, setCurrentColor] = useState<string>('brown');
  // tile(drawed) color
  const [tileColors, setTileColors] = useState<string[][]>(initializeTileColors());
  const [pixelInfo, setPixelInfo] = useState<PixelInfo | null>(null);

  // It updates the color of the clicked tile to the current selected color
  const handleTileClick = (tileX: number, tileY: number) => {
    const newTileColors = tileColors.map(row => [...row]);
    newTileColors[tileY][tileX] = currentColor;
    setTileColors(newTileColors);
  };

  const handlePixelInfoSubmit = (data: PixelInfo) => {
    // write logic to register pixel info to server or blockchain here
    setPixelInfo(data);
};



  return (
    <>
      <div className="app-container">
          <Canvas tileColors={tileColors} onTileClick={handleTileClick} />
        <div className="palette-area">
          {PRESETCOLORS.map((color) => (
            <div 
              key={color}
              className={`color-swatch ${currentColor === color ? 'selected' : ''}`}
              style={{ backgroundColor: color }}
              onClick={() => setCurrentColor(color)}
            />
          ))}
        </div>
        <div className="utility-area">
          <WalletConnect />
          <LandSelector />
          <PixelInfoForm onSubmit={handlePixelInfoSubmit} />
        </div>
      </div>
    </>
  );
}

export default App;
