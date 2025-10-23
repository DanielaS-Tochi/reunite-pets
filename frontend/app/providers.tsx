"use client";

import { WalletProvider } from "../app/context/WalletContext";

export function Providers({ children }) {
  return <WalletProvider>{children}</WalletProvider>;
}
