import ConnectWallet from "./components/ConnectWallet";

function App() {
  return (
    <div style={{ textAlign: "center", padding: "2rem" }}>
      <h1>🐾 ReunitePets</h1>
      <p>Connecting lost pets and loving homes — powered by Web3</p>
      <ConnectWallet />
    </div>
  );
}

export default App;
