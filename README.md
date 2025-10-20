<!-- # 🐾 Reunite-Pets

**Reunite-Pets** is a decentralized social network that reconnects lost pets with their families using blockchain-based identities, AI image matching, and community governance.

🔗 **GitHub Repository:** [github.com/DanielaS-Tochi/reunite-pets](https://github.com/DanielaS-Tochi/reunite-pets)

🌍 *Built for ETHOnline 2025 Hackathon*

---

## 🧩 TL;DR (for judges)

- **Category:** Social Network  
- **Network:** Ethereum Sepolia Testnet  
- **MVP:** Pet registration (on-chain), missing/found feed, wallet connect, map, IPFS images  
- **Stretch Goals:** Donations + voting, Proof of Care (SBT badges), AI image matching  

---

## 🚀 Tech Stack

| Layer | Technology |
|-------|-------------|
| Smart Contracts | Solidity, Foundry, OpenZeppelin |
| Frontend | Next.js, Wagmi, RainbowKit |
| Auth | Privy (Web2 + Web3 login bridge) |
| Storage | IPFS + Lighthouse (for images & pet data) |
| Network | Ethereum Sepolia Testnet |

---

## ⚙️ Quickstart (high-level)

1. Create a Codespace or clone this repo locally:

   ```bash
   git clone https://github.com/DanielaS-Tochi/reunite-pets
   cd reunite-pets

2. Install prerequisites: Node ≥ 18, **pnpm**, Foundry, Git.  
3. Follow setup instructions in `frontend/README.md` and `contracts/README.md`.

---

## 🤖 AI / Tools Disclosure

This project was **scaffolded and planned with AI assistance (ChatGPT)**.  
All code, tests, and deployment steps were developed and human-reviewed during **ETHOnline 2025**.

---
## 📝 Contracts & Testing

- **PetRegistry.sol**: On-chain pet registration, status updates, and owner mapping.
- **Donations.sol**: Donation tracking, voting for shelters, and community-driven allocation.
- **Tests**: All contracts tested using Foundry (`forge test`) with 100% pass rate.
- **Events**: PetRegistered, PetStatusUpdated, VoteCast, DonationDistributed.
- **IPFS Support**: Images and pet metadata stored off-chain for transparency and scalability.
---

## ❤️ Future Features

- AI image recognition for lost pets  
- Voting mechanism for community-driven donations  
- Decentralized shelter verification  
- Multilingual support (English + Spanish)  
- Mobile-friendly DApp with social features  

---

## 🤝 Contributing

Pull requests are welcome!  
For major changes, please open an issue first to discuss your proposal.

---

## 🧾 License

**MIT License**

---

## 📬 Contacts

- **Owner:** Daniela Silvana Tochi  
- **Project:** Reunite-Pets (ETHOnline 2025) -->

# 🐾 Reunite-Pets

**Reunite-Pets** is a decentralized social network that reconnects lost pets with their families using blockchain-based identities, AI image matching, and community governance.

🔗 **GitHub Repository:** [github.com/DanielaS-Tochi/reunite-pets](https://github.com/DanielaS-Tochi/reunite-pets)

🌍 *Built for ETHOnline 2025 Hackathon*

---

## 🧩 TL;DR (for judges)

- **Category:** Social Impact / Social Network  
- **Network:** Ethereum Sepolia Testnet  
- **MVP:** On-chain pet registry, wallet connect, missing/found feed, map, IPFS images  
- **Stretch Goals:** Donations + voting, Proof of Care (SBT badges), AI image matching  

---

## 🚀 Tech Stack

| Layer | Technology |
|-------|-------------|
| Smart Contracts | Solidity, Foundry, OpenZeppelin |
| Frontend | Next.js, Wagmi, RainbowKit |
| Auth | Privy (Web2 + Web3 login bridge) |
| Storage | IPFS + Lighthouse (images & metadata) |
| Network | Ethereum Sepolia Testnet |

---

## ⚙️ Quickstart

### 1️⃣ Clone the repository
```bash
git clone https://github.com/DanielaS-Tochi/reunite-pets.git
cd reunite-pets

2️⃣ Setup contracts (Foundry)
cd contracts
forge install
forge build
forge test -vv

✅ All current tests pass successfully (9/9) using Foundry.

3️⃣ Setup frontend
cd frontend
pnpm install
pnpm run dev

Access the app at: http://localhost:3000

🧠 Smart Contracts Overview
PetRegistry.sol

Registers pets on-chain with owner mapping.

Emits events:

PetRegistered

PetStatusUpdated

Ensures ownership control for updates.

Future-ready for IPFS image hashes and geolocation metadata.

Donations.sol

Tracks donations and community voting.

Distributes pooled funds transparently.

Events:

VoteCast

DonationDistributed

Designed for DAO integration (future Proof of Care SBTs).

🧪 Testing

All tests are written using Foundry (forge test):

| Contract            | Tests | Status   |
| ------------------- | ----- | -------- |
| `PetRegistry.t.sol` | 5     | ✅ Passed |
| `Donations.t.sol`   | 4     | ✅ Passed |

Total: 9 tests passed (0 failed, 0 skipped)

🤖 AI / Tools Disclosure

This project was scaffolded and planned with AI assistance (ChatGPT).
All code, tests, and deployment steps were developed and human-reviewed during ETHOnline 2025.

❤️ Roadmap / Future Features

🐶 AI image recognition for lost pets

🏛️ Community-driven donations & governance

🧾 Decentralized shelter verification

🌐 Multilingual interface (English + Spanish)

📱 Mobile-friendly UI with social feed

🤝 Contributing

Pull requests are welcome!
For major changes, please open an issue first to discuss your proposal.

🧾 License

MIT License

📬 Contacts

Owner: Daniela Silvana Tochi

Project: Reunite-Pets (ETHOnline 2025)

Network: Ethereum Sepolia Testnet

Email: danielastochi@gmail.com




