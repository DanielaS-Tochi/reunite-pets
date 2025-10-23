export default function Footer() {
  return (
    <footer className="mt-12 bg-transparent py-6 border-t border-white/20">
      <div className="container mx-auto px-4 text-sm text-white/80">
        © {new Date().getFullYear()} ReunitePets — Built for ETHOnline 2025 ·{" "}
        <a className="underline text-white/80 hover:text-white" href="https://github.com/DanielaS-Tochi/reunite-pets">
          Repo
        </a>
      </div>
    </footer>
  );
}
