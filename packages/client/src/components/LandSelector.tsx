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

    const { setChainId, setLandId } = context;

    const { components: { ChainComponent },} = useMUD();

    const [all_chain_component_data, setAllChainComponentData] = useState<any[]>([]);

    useEffect(() => {
        const fetchChainData = async () => {
            const filtered_entities = Array.from(await runQuery([Has(ChainComponent)]));
            const fetchedData: any = [];

            filtered_entities.forEach((entity) => {
                const chain_component_value = getComponentValue(ChainComponent, entity);
                if (chain_component_value) {
                    fetchedData.push(chain_component_value);
                }
            });

            setAllChainComponentData(fetchedData);
        };

        fetchChainData();
    }, []); // この空の依存配列により、このuseEffectはコンポーネントがマウントされたときに一度だけ実行されます
    console.log("all_chain_component_data",all_chain_component_data)

    // hold the currently selected chain's ID
    const [selectedChain, setSelectedChain] = useState<string | null>(null);
    // hold the list of lands associated with the selected chain
    const [lands, setLands] = useState<number[]>([]);

    const handleChainChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
        const selectedChainName = event.target.value;
        const chainData = all_chain_component_data.find((chain: any) => chain.chainName === selectedChainName);

        setSelectedChain(chainData.chainName);
        setLands(Array.from({ length: chainData.landCount }).map((_, idx) => idx + 1));
        setChainId(chainData.chainID);
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
                {all_chain_component_data.map((chain: any) => (
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
