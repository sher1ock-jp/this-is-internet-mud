export const TILE_SIZE = 10;
export const MAP_SIZE = 70;
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

export const CHAINS = [
  { name: 'Ethereum', id_for_backend: 0x1,id_for_contract:1},
  { name: 'OP+mainnet', id_for_backend: 0xa,id_for_contract:10 },
  { name: 'Base', id_for_backend: 0x2105,id_for_contract:8453 }, 
  { name: 'BNB', id_for_backend: 0x38,id_for_contract:56 },
  { name: 'Polygon+PoS', id_for_backend: 0x89, id_for_contract:137 },
  { name: 'Avalanche+C-chain', id_for_backend: 0xa86a, id_for_contract:43114 },
  { name: 'Celo', id_for_backend: 0xa4ec,id_for_contract:42220 },
  { name: 'Gnosis', id_for_backend: 0x64, color: '#11765B',id_for_contract:100 },
  { name: 'Arbitrum+One', id_for_backend: 0xa4b1,id_for_contract:42129 },
];
