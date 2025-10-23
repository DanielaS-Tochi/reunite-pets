// src/components/DonationForm.tsx
"use client";
import { useState } from "react";

export default function DonationForm() {
  const [amount, setAmount] = useState<string>("0.01");

  const onSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    // TODO: wire to Donations contract using wagmi/ethers
    alert(`Donate ${amount} ETH (not yet implemented)`);
  };

  return (
    <form onSubmit={onSubmit} className="bg-white p-4 rounded shadow">
      <label className="block text-sm font-medium mb-2">Donate (ETH)</label>
      <input
        type="number"
        step="0.001"
        min="0.001"
        value={amount}
        onChange={(e) => setAmount(e.target.value)}
        className="w-full border rounded px-3 py-2 mb-3"
      />
      <button className="bg-emerald-500 text-white px-4 py-2 rounded">Donate</button>
    </form>
  );
}
