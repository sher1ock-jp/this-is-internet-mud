import { useState } from 'react';

interface Props {
    onSubmit: (data: PixelInfo) => void;
}

export interface PixelInfo {
    category: string;
    productName: string;
    contractAddress: string;
}

const PixelInfo = ({ onSubmit }: Props) => {
    const [info, setInfo] = useState<PixelInfo>({
        category: '',
        productName: '',
        contractAddress: '',
    });
    const [error, setError] = useState<string | null>(null);

    const handleSubmit = () => {
        const {category,productName,contractAddress } = info;

        if (!category || !productName || !contractAddress) {
            setError("enter all fields");
            return;
        }

        setError(null);
        onSubmit(info);
    };

    return (
        <div className="pixel-form">
            <input
                placeholder="category"
                value={info.category}
                onChange={e => setInfo(prev => ({ ...prev, mainCategory: e.target.value }))}
            />
            <input
                placeholder="product name"
                value={info.productName}
                onChange={e => setInfo(prev => ({ ...prev, productName: e.target.value }))}
            />
            <input
                placeholder="contract address"
                value={info.contractAddress}
                onChange={e => setInfo(prev => ({ ...prev, contractAddress: e.target.value }))}
            />
            <button onClick={handleSubmit}>REGISTER ADDRESS</button>
            {error && <p style={{ color: 'red' }}>{error}</p>}
        </div>
    );
};

export default PixelInfo;