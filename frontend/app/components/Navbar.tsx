"use client";
import Link from "next/link";
import { ConnectButton } from "@rainbow-me/rainbowkit";

export default function Navbar() {
  return (
    <header className="bg-transparent shadow-none">
      <div className="container mx-auto px-4 py-4 flex items-center justify-between">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 bg-emerald-400 rounded-full flex items-center justify-center text-white font-bold">
            🐾
          </div>
          <Link href="/" className="font-semibold text-lg text-white">
            ReunitePets
          </Link>
        </div>

        <nav className="flex items-center gap-4">
          <Link href="/dashboard" className="text-sm text-white hover:text-gray-200">
            Dashboard
          </Link>
          <Link href="/register" className="text-sm text-white hover:text-gray-200">
            Register Pet
          </Link>
          <ConnectButton showBalance={false} />
        </nav>
      </div>
    </header>
  );
}
