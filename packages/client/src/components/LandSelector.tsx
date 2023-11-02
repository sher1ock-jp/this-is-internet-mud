import React from 'react';

interface LandSelectorProps {
    allChainEntities: any[];
    selectedChainName: string | null;
    setSelectedChainName: React.Dispatch<React.SetStateAction<string | null>>;
    setSelectedChainId: React.Dispatch<React.SetStateAction<string>>;
    setSelectedLandId: React.Dispatch<React.SetStateAction<number>>;
    lands: number[];
    setLands: React.Dispatch<React.SetStateAction<number[]>>;
}

const LandSelector = ({
    allChainEntities,
    selectedChainName, setSelectedChainName,
    lands, setLands,
    setSelectedChainId,
    setSelectedLandId
}:LandSelectorProps) => {
    
    const processChainSelection = (event: React.ChangeEvent<HTMLSelectElement>) => { // when a chain is selected,  update the lands array
        const selected_chain_name = event.target.value;
        const chain_entity = allChainEntities.find(chain => chain.chainName === selected_chain_name);

        if (chain_entity) {
            setSelectedChainName(chain_entity.chainName);
            setLands(Array.from({ length: chain_entity.landCount }).map((_, idx) => idx + 1));
            setSelectedChainId(chain_entity.chainID);
        }
    };

    const createNewLand = () => {
        const new_land_id = lands.length + 1;
        setLands(prevLands => [...prevLands, new_land_id]);
        setSelectedLandId(new_land_id);
    };

    return (
        <div className="land-selector">
            <select value={selectedChainName || ""} onChange={processChainSelection}>
                <option value="">-- choose chain --</option>
                {allChainEntities.map(chain => (
                    <option key={chain.chainName} value={chain.chainName}>{chain.chainName}</option>
                ))}
            </select>
            
            {selectedChainName && (
                <>
                    <ul>
                        {lands.map(landId => (
                            <li key={landId} onClick={() => setSelectedLandId(landId)}>
                                LAND {landId}
                            </li>
                        ))}
                    </ul>
                    <button onClick={createNewLand}>CREATE LAND</button>
                </>
            )}
        </div>
    );
};

export default LandSelector;
