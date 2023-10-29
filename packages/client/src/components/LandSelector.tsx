import React, { useState } from 'react';
import {chains} from '../constants';

const LandSelector = () => {
    // hold the currently selected chain's ID
    const [selectedChain, setSelectedChain] = useState<string | null>(null);
    // hold the list of lands associated with the selected chain
    const [lands, setLands] = useState<number[]>([]);

    const defaultLandsForChains = chains.reduce((acc, chain) => {
        acc[chain.id] = [1];
        return acc;
    }, {} as Record<string, number[]>);

    const handleChainChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
        // set the selected chain's ID based on user's choice
        setSelectedChain(event.target.value);
        // a mock list of lands [1, 2, 3] is set
        setLands(defaultLandsForChains[event.target.value] || []);
    };

    const handleLandCreation = () => {
        const newLandId = lands.length + 1;
         // update the lands state by adding the new land ID
        setLands(prevLands => [...prevLands, newLandId]);
    };

    return (
        <div className="land-selector">
            <select onChange={handleChainChange}>
                <option value="">-- choose chain --</option>
                {/* Loop through the list of chains and render them as options in the dropdown. */}
                {chains.map(chain => (
                    <option key={chain.id} value={chain.id}>{chain.name}</option>
                ))}
            </select>
            
             {/* If a chain is selected, display the list of associated lands and provide an option to create a new land. */}
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
