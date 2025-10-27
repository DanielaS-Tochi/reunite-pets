import { useState, useEffect } from "react";
// import { ethers } from "ethers";
import "./App.css";

function App() {
  const [currentAccount, setCurrentAccount] = useState(null);

  // Verifica si hay una wallet conectada previamente
  useEffect(() => {
    checkIfWalletIsConnected();
  }, []);

  async function checkIfWalletIsConnected() {
    try {
      const { ethereum } = window;
      if (!ethereum) {
        console.log("MetaMask no está instalada");
        return;
      }

      const accounts = await ethereum.request({ method: "eth_accounts" });
      if (accounts.length > 0) {
        setCurrentAccount(accounts[0]);
      }
    } catch (error) {
      console.error("Error al verificar conexión:", error);
    }
  }

  async function connectWallet() {
    try {
      const { ethereum } = window;
      if (!ethereum) {
        alert("Por favor instala MetaMask para continuar 🦊");
        return;
      }

      const accounts = await ethereum.request({ method: "eth_requestAccounts" });
      setCurrentAccount(accounts[0]);
    } catch (error) {
      console.error("Error al conectar:", error);
    }
  }

  async function disconnectWallet() {
    // No existe método directo para desconectar MetaMask, así que limpiamos el estado
    setCurrentAccount(null);
  }

  return (
    <div className="App">
      <header className="navbar">
        <h1>Reunite Pets 🐾</h1>
        <nav className="nav-right">
          <a href="#">Inicio</a>
          <a href="#">Acerca</a>
          {currentAccount ? (
            <button className="connect-btn disconnect" onClick={disconnectWallet}>
              Desconectar
            </button>
          ) : (
            <button className="connect-btn" onClick={connectWallet}>
              Conectar Wallet
            </button>
          )}
        </nav>
      </header>

      <main className="content">
        <h2>{currentAccount ? "Wallet conectada 🦊" : "Conectá tu wallet"}</h2>

        {currentAccount ? (
          <div className="wallet-card">
            <p><strong>Dirección:</strong> {currentAccount}</p>
            <p><strong>Red:</strong> Ethereum / Sepolia</p>
          </div>
        ) : (
          <p>Haz clic en "Conectar Wallet" para comenzar.</p>
        )}
      </main>

      <footer>
        <p>Design by Daniela Tochi © {new Date().getFullYear()}</p>
      </footer>
    </div>
  );
}

export default App;

