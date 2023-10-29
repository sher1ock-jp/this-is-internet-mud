import React, { useState, useEffect } from 'react';
import { useMUD } from "../MUDContext";
import { 
  HasValue,
  runQuery,
  getComponentValue,
  Has,
} from "@latticexyz/recs";

import ChainLandContext from '../ChainLandContext';

const LandSelector = () => {
    const context = React.useContext(ChainLandContext);

    if (!context) {
        throw new Error('LandSelector must be used within a ChainLandContext.Provider');
    }

    const { components: { ChainComponent },} = useMUD();

    const { setChainId, setLandId } = context;

    const [allChainData, setAllChainData] = useState<any[]>([]);
    const [selectedChain, setSelectedChain] = useState<string | null>(null); // hold the currently selected chain's ID
    const [lands, setLands] = useState<number[]>([]); // hold the list of lands associated with the selected chain

    useEffect(() => {
        const fetchChainData = async () => {
            const entities = await runQuery([Has(ChainComponent)]);
            const fetchedData = Array.from(entities)
                .map(entity => getComponentValue(ChainComponent, entity))
                .filter(Boolean);

            setAllChainData(fetchedData);
        };

        fetchChainData();
    }, []);

    const handleChainChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
        const selectedChainName = event.target.value;
        const chainData = allChainData.find(chain => chain.chainName === selectedChainName);

        if (chainData) {
            setSelectedChain(chainData.chainName);
            setLands(Array.from({ length: chainData.landCount }).map((_, idx) => idx + 1));
            setChainId(chainData.chainID);
        }
    };

    const handleLandCreation = () => {
        const newLandId = lands.length + 1;
        setLands(prevLands => [...prevLands, newLandId]);
        setLandId(newLandId);
    };

    return (
        <div className="land-selector">
            <select onChange={handleChainChange}>
                <option value="">-- choose chain --</option>
                {allChainData.map(chain => (
                    <option key={chain.chainName} value={chain.chainName}>{chain.chainName}</option>
                ))}
            </select>
            
            {selectedChain && (
                <>
                    <ul>
                        {lands.map(landId => (
                            <li key={landId}>LAND {landId}</li>
                        ))}
                    </ul>
                    <button onClick={handleLandCreation}>Create LAND</button>
                </>
            )}
        </div>
    );
};

export default LandSelector;
