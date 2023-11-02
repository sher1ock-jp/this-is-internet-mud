import { PRESETCOLORS } from '../constants';

type ColorPaletteProps = {
  currentColor: string;
  setCurrentColor: React.Dispatch<React.SetStateAction<string>>;
  canvasMode: "INPUT" | "VIEW";
  setCanvasMode: React.Dispatch<React.SetStateAction<"INPUT" | "VIEW">>;
}

const ColorPalette = ({ currentColor, setCurrentColor, canvasMode, setCanvasMode }: ColorPaletteProps) => {
  return (
    <>
      <button 
          className="mode-toggle-button" 
          onClick={() => setCanvasMode(prev => prev === "INPUT" ? "VIEW" : "INPUT")}
      >
        {canvasMode} Mode
      </button>
      {Object.entries(PRESETCOLORS).map(([key, color]) => (
        <div 
          key={key} 
          className={`color-swatch ${currentColor === color ? 'selected' : ''}`}
          style={{ backgroundColor: color }}
          onClick={() => setCurrentColor(color)}
        />
      ))}
    </>
  );
}

export default ColorPalette;
