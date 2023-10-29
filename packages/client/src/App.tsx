import { useState } from 'react';
import { MAP_SIZE, TILE_SIZE, PRESETCOLORS } from './constants';
import './App.css';
import Canvas from './components/Canvas'; 
import WalletConnect from './components/WalletConnect';
import LandSelector from './components/LandSelector';
import PixelInfoForm, {PixelInfo} from './components/PixelInfoForm';
import ChainLandContext from './ChainLandContext';

// Utility function to initialize a 2D array (representing the map/grid)
const initializeTileColors = () => {
  return Array.from({ length: MAP_SIZE }, () => Array(MAP_SIZE).fill('white'));
};

const App = () => {
  const [chainId, setChainId] = useState<string>('');
  const [landId, setLandId] = useState<number>(1);
  const [currentColor, setCurrentColor] = useState<string>('brown'); // pallette color for drawing
  const [tileColors, setTileColors] = useState<string[][]>(initializeTileColors()); // tile(drawed) color
  const [pixelInfo, setPixelInfo] = useState<PixelInfo | null>(null);

  const idToXy = (id: number) => {
    const x = id % MAP_SIZE;
    const y = Math.floor(id / MAP_SIZE);
    return { x, y };
  }

  // It updates the color of the clicked tile to the current selected color
  const handleTileClick = (id: number) => {
    const { x, y } = idToXy(id);  // Convert the ID back to x, y coordinates
    const newTileColors = tileColors.map(row => [...row]);
    newTileColors[y][x] = currentColor;
    setTileColors(newTileColors);
  };

  const handlePixelInfoSubmit = (data: PixelInfo) => {
    setPixelInfo(data); // write logic to register pixel info to server or blockchain here
  };

  const renderColorPalette = () => {
    return PRESETCOLORS.map((color) => (
      <div 
        key={color}
        className={`color-swatch ${currentColor === color ? 'selected' : ''}`}
        style={{ backgroundColor: color }}
        onClick={() => setCurrentColor(color)}
      />
    ));
  }

  return (
    <>
       <ChainLandContext.Provider value={{ chainId, landId, setChainId, setLandId }}>
        <div className="app-container">
            <Canvas tileColors={tileColors} onTileClick={handleTileClick} />
          <div className="palette-area">
            {renderColorPalette()}
          </div>
          <div className="utility-area">
            <WalletConnect />
            <LandSelector />
            <PixelInfoForm onSubmit={handlePixelInfoSubmit} />
          </div>
        </div>
      </ChainLandContext.Provider>
    </>
  );
}

export default App;
