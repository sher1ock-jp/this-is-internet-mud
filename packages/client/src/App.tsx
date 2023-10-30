import { useState,useEffect } from 'react';
import { MAP_SIZE, TILE_SIZE, PRESETCOLORS } from './constants';
import './App.css';
import Canvas from './components/Canvas'; 
import WalletConnect from './components/WalletConnect';
import LandSelector from './components/LandSelector';
import PixelInfoForm, {PixelInfo} from './components/PixelInfoForm';
import ChainLandContext from './ChainLandContext';
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
  const [chainId, setChainId] = useState<string>('');
  const [landId, setLandId] = useState<number>(1);
  const [currentColor, setCurrentColor] = useState<string>('brown'); // pallette color for drawing
  const [tileColors, setTileColors] = useState<string[][]>(initializeTileColors()); // tile(drawed) color
  const [pixelInfo, setPixelInfo] = useState<PixelInfo | null>(null);

  const { components: { Pixel },} = useMUD();

  // const entities = runQuery([HasValue(Pixel, { chainID: Number(chainId), landID: landId })]);
  // const fetchedData = Array.from(entities)
  //     .map(entity => getComponentValue(Pixel, entity))
  //     .filter(Boolean);

  const initializePixelFromBlockchain = (fetchedPixels: any[]) => {
    const newTileColors = initializeTileColors();
    fetchedPixels.forEach(data => {
      const { x, y } = idToXy(data.connectedPixelId);
      newTileColors[y][x] = PRESETCOLORS[data.pixelColor as keyof typeof PRESETCOLORS];
    });
    setTileColors(newTileColors);
  };

  useEffect(() => {
    const entities = runQuery([HasValue(Pixel, { chainID: Number(chainId), landID: landId })]);
    const fetchedData = Array.from(entities)
        .map(entity => getComponentValue(Pixel, entity))
        .filter(Boolean) as any[];
    
        initializePixelFromBlockchain(fetchedData);
  }, [chainId, landId]);


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
    return Object.entries(PRESETCOLORS).map(([key, color]) => (
        <div 
            key={key} 
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
