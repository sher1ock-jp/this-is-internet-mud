export const TILE_SIZE = 15;
export const MAP_SIZE = 200;
export const PRESETCOLORS = {
  0:"#D32F2F", // strong red
  1:"#E57373", // light red
  2:"#7B1FA2", // strong purple
  3:"#BA68C8", // light purple
  4:"#303F9F", // strong indigo
  5:"#64B5F6", // light indigo
  6:"#00796B", // strong teal
  7:"#4DB6AC", // light teal
  8:"#689F38", // strong green
  9:"#AED581", // light green
  10:"#AFB42B", // strong lime
  11:"#FFF176", // light lime
  12:"#FFA000", // strong amber
  13:"#FFCC80", // light amber
  14:"#8D6E63", // strong brown
  15:"#D7CCC8"  // light brown
};

export const chains = [
  { name: 'Ethereum', id: 0x1,color: '#121212',decimal:1},
  { name: 'OP+mainnet', id: 0xa, color: '#FC0721',decimal:10 },
  { name: 'Base', id: 0x2105,color: '#799CF5',decimal:8453 }, 
  { name: 'BNB', id: 0x38, color: '#F0B90B',decimal:56 },
  { name: 'Polygon+PoS', id: 0x89, color: '#8C44ED',decimal:137 },
  { name: 'Avalanche+C-chain', id: 0xa86a, color: '#E84440',decimal:43114 },
  { name: 'Celo', id: 0xa4ec, color: '#809863',decimal:42220 },
  { name: 'Gnosis', id: 0x64, color: '#11765B',decimal:100 },
  { name: 'Arbitrum+One', id: 0xa4b1,color: '#2050DE',decimal:42129 },
];
