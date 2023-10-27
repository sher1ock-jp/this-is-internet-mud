import React, { useState } from 'react';

const chains = [
    { name: 'Ethereum (L1)', id: 1, description: '主要なスマートコントラクトプラットフォーム。' },
    { name: 'Binance Smart Chain (L1)', id: 56, description: 'Binanceの提供するスマートコントラクト対応のブロックチェーン。' },
];

const LandSelector = () => {
    const [selectedChain, setSelectedChain] = useState<string | null>(null);
    const [lands, setLands] = useState<number[]>([]);

    const handleChainChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
        setSelectedChain(event.target.value);
        // こちらで土地一覧を取得するロジックを追加できます
        // 今回の例では、選択されたチェーンのIDを基に土地一覧を配列として設定しています
        setLands([1, 2, 3]);  // 仮の土地一覧
    };

    const handleLandCreation = () => {
        const newLandId = lands.length + 1;
        setLands(prevLands => [...prevLands, newLandId]);
    };

    return (
        <div className="land-selector">
            <select onChange={handleChainChange}>
                <option value="">-- choose chain --</option>
                {chains.map(chain => (
                    <option key={chain.id} value={chain.id}>{chain.name}</option>
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
