import {
  getDefaultConfig,
  RainbowKitProvider,
  ConnectButton,
} from "@rainbow-me/rainbowkit";
import { WagmiProvider } from "wagmi";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { mainnet, sepolia } from "wagmi/chains";
import "./App.css";

const config = getDefaultConfig({
  appName: "Reunite Pets",
  projectId: "YOUR_WALLETCONNECT_PROJECT_ID", 
  chains: [sepolia, mainnet],
});

const queryClient = new QueryClient();

export default function App() {
  return (
    <WagmiProvider config={config}>
      <QueryClientProvider client={queryClient}>
        <RainbowKitProvider>
          <div className="app-container">
            <h1>🐾 Reunite Pets</h1>
            <ConnectButton label="Connect Wallet" />
          </div>
        </RainbowKitProvider>
      </QueryClientProvider>
    </WagmiProvider>
  );
}
