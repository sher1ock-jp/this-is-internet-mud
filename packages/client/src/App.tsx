import { useState } from 'react';
import { MAP_SIZE, TILE_SIZE, PRESETCOLORS } from './constants';
import './App.css';
import Canvas from './components/Canvas'; 
import WalletConnect from './components/WalletConnect';
import LandSelector from './components/LandSelector';
import PixelInfoForm, {PixelInfo} from './components/PixelInfoForm';

const initializeTileColors = () => {
  return Array.from({ length: MAP_SIZE }, () => Array(MAP_SIZE).fill('white'));
};

const App = () => {
  const [currentColor, setCurrentColor] = useState<string>('brown');
  const [tileColors, setTileColors] = useState<string[][]>(initializeTileColors());
  const [pixelInfo, setPixelInfo] = useState<PixelInfo | null>(null);

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
        <div className="pixel-area">
          <Canvas tileColors={tileColors} onTileClick={handleTileClick} />
        </div>
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
