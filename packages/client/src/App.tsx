import { useState,useEffect } from 'react';
import { CHAINS, PRESETCOLORS } from './constants';
import './App.css';
import Canvas from './components/Canvas'; 
import WalletConnect from './components/WalletConnect';
import LandSelector from './components/LandSelector';
import Palette from './components/Palette';
import PixelForm, {PixelInfo} from './components/PixelForm';
import { useMUD } from "./MUDContext";
import { 
  HasValue,
  runQuery,
  getComponentValue,
  Has,
} from "@latticexyz/recs";
import { initializePixelColors, idToXy } from './utils';

const App = () => {
  const { components: { Pixel,ChainComponent },} = useMUD();
  /* AppData */
  const [chainBgColor, setChainBgColor] = useState<string>('#fff');
  /* ColorPaletteData */
  const [currentColor, setCurrentColor] = useState<string>('brown'); 
  /* CanvasData */
  const [pixelColors, setPixelColors] = useState<string[][]>(initializePixelColors()); 
  const [canvasMode, setCanvasMode] = useState<"INPUT" | "VIEW">("INPUT");
  /* LandData */
  const [allChainEntities, setAllChainEntity] = useState<any[]>([]);
  const [selectedChainName, setSelectedChainName] = useState<string | null>(null);
  const [selectedChainId, setSelectedChainId] = useState<string>('');
  const [selectedLandId, setSelectedLandId] = useState<number>(1);
  const [lands, setLands] = useState<number[]>([]);
  /* PixelInfoData */
  const [pixelInfo, setPixelInfo] = useState<PixelInfo | null>(null);

  useEffect(() => {
    const chain_entities = runQuery([Has(ChainComponent)]);
    const all_chain_component = Array.from(chain_entities).map(entity => getComponentValue(ChainComponent, entity)).filter(Boolean);
    setAllChainEntity(all_chain_component);
  }, []);

  useEffect(() => {
    const pixel_entities = runQuery([HasValue(Pixel, { chainID: Number(selectedChainId), landID: selectedLandId })]);
    const existing_pixels = Array.from(pixel_entities).map(entity => getComponentValue(Pixel, entity)).filter(Boolean);
    initializePixelFromBlockchain(existing_pixels);
  }, [selectedChainId, selectedLandId]);

  useEffect(() => {
    const chain_entitities = runQuery([HasValue(ChainComponent, { chainID: Number(selectedChainId)})]);
    const chain_entitity = Array.from(chain_entitities).map(entity => getComponentValue(ChainComponent, entity)).filter(Boolean);
    if (chain_entitity.length > 0 && chain_entitity[0]) {
      const color = chain_entitity[0].chainColor;
      setChainBgColor(color || '#fff');
    }
  }, [selectedChainId]);

  const initializePixelFromBlockchain = (fetchedPixels: any[]) => { 
    const new_pixel_colors = initializePixelColors();
    fetchedPixels.forEach(data => {
      const { x, y } = idToXy(data.pixelID);
      new_pixel_colors[y][x] = PRESETCOLORS[data.pixelColor as keyof typeof PRESETCOLORS];
    });
    setPixelColors(new_pixel_colors);
  };

  const handlePixelUpdate = (id: number) => {
    const { x, y } = idToXy(id);
    const new_pixel_colors = [...pixelColors];
    new_pixel_colors[y][x] = currentColor;
    setPixelColors(new_pixel_colors);
  };

  const handlePixelInfoSubmit = (data: PixelInfo) => {
    setPixelInfo(data);
  };

  return (
    <>
      <div className="app-container">
        <div className="pixel-area" style={{ backgroundColor: chainBgColor }}>
          <Canvas 
            pixelColors={pixelColors} 
            handlePixelUpdate={handlePixelUpdate}
            selectedChainName={selectedChainName}
            setSelectedChainName={setSelectedChainName}
            selectedChainId={selectedChainId}
            setSelectedChainId={setSelectedChainId}
            selectedLandId={selectedLandId}
            setSelectedLandId={setSelectedLandId}
            canvasMode={canvasMode}
          />
        </div>
        <div className="palette-area">
          <Palette
            currentColor={currentColor} 
            setCurrentColor={setCurrentColor} 
            canvasMode={canvasMode}
            setCanvasMode={setCanvasMode}
          />
        </div>
        <div className="utility-area">
          <WalletConnect />
          <LandSelector
            allChainEntities={allChainEntities} 
            selectedChainName={selectedChainName}
            setSelectedChainName={setSelectedChainName}
            setSelectedChainId={setSelectedChainId}
            setSelectedLandId={setSelectedLandId}
            lands={lands}
            setLands={setLands}
          />
          <PixelForm onSubmit={handlePixelInfoSubmit} />
        </div>
      </div>
    </>
  );
}

export default App;
