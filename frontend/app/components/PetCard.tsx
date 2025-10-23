// src/components/PetCard.tsx
import React from "react";

type Props = {
  id: number;
  name: string;
  breed: string;
  ipfsHash?: string;
  status?: string;
};

export default function PetCard({ id, name, breed, ipfsHash, status }: Props) {
  return (
    <article className="bg-white/20 backdrop-blur-sm rounded-lg shadow p-4 text-black">
      <div className="flex gap-4">
        <div className="w-24 h-24 bg-slate-100 rounded-md flex items-center justify-center">
          {ipfsHash ? (
            <img src={`https://ipfs.io/ipfs/${ipfsHash}`} alt={name} className="w-full h-full object-cover rounded-md" />
          ) : (
            <div className="text-slate-400">No image</div>
          )}
        </div>

        <div>
          <h3 className="text-lg font-semibold">{name}</h3>
          <p className="text-sm text-slate-600">{breed}</p>
          <p className="mt-2 text-xs text-slate-500">Status: <span className="font-medium">{status ?? "Home"}</span></p>
        </div>
      </div>
    </article>
  );
}
