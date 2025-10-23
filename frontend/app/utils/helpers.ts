// src/utils/helpers.ts
export function truncateAddress(addr?: string, len = 6) {
  if (!addr) return "";
  return `${addr.slice(0, len)}...${addr.slice(-4)}`;
}
