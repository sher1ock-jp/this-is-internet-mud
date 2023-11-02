import { MAP_SIZE, PRESETCOLORS } from './constants';

export const initializePixelColors = () => {
  return Array.from({ length: MAP_SIZE }, () => Array(MAP_SIZE).fill('white'));
};

export const idToXy = (id: number) => {
  const x = id % MAP_SIZE;
  const y = Math.floor(id / MAP_SIZE);
  return { x, y };
}