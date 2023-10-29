import React from 'react';

type ChainLandContextType = {
  chainId: string | null;
  landId: number | null;
  setChainId: React.Dispatch<React.SetStateAction<string | null>>;
  setLandId: React.Dispatch<React.SetStateAction<number | null>>;
};

const ChainLandContext = React.createContext<ChainLandContextType | undefined>(undefined);

export default ChainLandContext;