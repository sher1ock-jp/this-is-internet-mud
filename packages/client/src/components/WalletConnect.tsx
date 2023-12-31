import '@rainbow-me/rainbowkit/styles.css';
import {
  getDefaultWallets,
  RainbowKitProvider,
} from '@rainbow-me/rainbowkit';
import { ConnectButton } from '@rainbow-me/rainbowkit';

import { configureChains, createConfig, WagmiConfig } from 'wagmi';
import {
  optimism,
} from 'wagmi/chains';
import { alchemyProvider } from 'wagmi/providers/alchemy';
import { publicProvider } from 'wagmi/providers/public';

const WalletConnect = () => {
  const { chains, publicClient } = configureChains(
    [optimism],
    [
      alchemyProvider({ apiKey: import.meta.env.VITE_ALCHEMY_PROVIDER }),
      publicProvider()
    ]
  );

  const { connectors } = getDefaultWallets({
    appName: 'here_is_internet',
    projectId: '4da308ff8015e2cd7401c51d2696d131',
    chains
  });

  const wagmiConfig = createConfig({
    autoConnect: true,
    connectors,
    publicClient
  });

  return (
    <WagmiConfig config={wagmiConfig}>
      <RainbowKitProvider chains={chains}>
        <ConnectButton />
      </RainbowKitProvider>
    </WagmiConfig>
  );
};

export default WalletConnect;