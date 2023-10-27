import React, { useState } from 'react';

interface Props {
    onSubmit: (data: PixelInfo) => void;
}

export interface PixelInfo {
    contractAddress: string;
    mainCategory: string;
    subCategory: string;
    productName: string;
    description: string;
}

const PixelInfoForm = ({ onSubmit }: Props) => {
    const [info, setInfo] = useState<PixelInfo>({
        contractAddress: '',
        mainCategory: '',
        subCategory: '',
        productName: '',
        description: '',
    });
    const [error, setError] = useState<string | null>(null);

    const handleSubmit = () => {
        const { contractAddress, mainCategory, subCategory, productName, description } = info;

        if (!contractAddress || !mainCategory || !subCategory || !productName || !description) {
            setError("enter all fields");
            return;
        }

        setError(null);
        onSubmit(info);
    };

    return (
        <div className="pixel-info-form">
            <input
                placeholder="contract address"
                value={info.contractAddress}
                onChange={e => setInfo(prev => ({ ...prev, contractAddress: e.target.value }))}
            />
            <input
                placeholder="main category"
                value={info.mainCategory}
                onChange={e => setInfo(prev => ({ ...prev, mainCategory: e.target.value }))}
            />
            <input
                placeholder="sub category"
                value={info.subCategory}
                onChange={e => setInfo(prev => ({ ...prev, subCategory: e.target.value }))}
            />
            <input
                placeholder="product name"
                value={info.productName}
                onChange={e => setInfo(prev => ({ ...prev, productName: e.target.value }))}
            />
            <textarea
                placeholder="explanation"
                value={info.description}
                onChange={e => setInfo(prev => ({ ...prev, description: e.target.value }))}
            />
            <button onClick={handleSubmit}>register</button>
            {error && <p style={{ color: 'red' }}>{error}</p>}
        </div>
    );
};

export default PixelInfoForm;