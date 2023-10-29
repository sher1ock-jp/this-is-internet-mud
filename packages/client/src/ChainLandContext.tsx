import React from 'react';

type ChainLandContextType = {
  chainId: string;
  landId: number;
  setChainId: React.Dispatch<React.SetStateAction<string>>;
  setLandId: React.Dispatch<React.SetStateAction<number>>;
};

const ChainLandContext = React.createContext<ChainLandContextType | undefined>(undefined);

export default ChainLandContext;