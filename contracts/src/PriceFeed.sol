// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IPyth} from "pyth-sdk-solidity/IPyth.sol";
import {PythStructs} from "pyth-sdk-solidity/PythStructs.sol";

/// @title PriceFeed - Oráculo Pyth para obtener el precio ETH/USD
/// @notice Devuelve el precio en USD y la fecha de actualización
contract PriceFeed {
    IPyth public pyth;

    /// @param _pyth Dirección del contrato de Pyth en la red (Sepolia u otra)
    constructor(address _pyth) {
        pyth = IPyth(_pyth);
    }

    /// @notice Obtiene el precio más reciente de ETH/USD desde Pyth
    /// @dev Devuelve precio, confianza y exponente
    function getLatestEthUsd()
        external
        view
        returns (int64 price, uint64 conf, int32 expo, uint publishTime)
    {
        bytes32 priceId = 0xff61491a931112ddf1bd8147cd1b641375f79f5825126d665480874634fd0ace;
        PythStructs.Price memory priceData = pyth.getPriceUnsafe(priceId);
        return (priceData.price, priceData.conf, priceData.expo, priceData.publishTime);
    }

    /// @notice Convierte un monto en wei a su valor aproximado en USD
    /// @param amountWei Monto en wei (1 ETH = 1e18 wei)
    function convertEthToUsd(uint amountWei) external view returns (uint usdValue) {
        bytes32 priceId = 0xff61491a931112ddf1bd8147cd1b641375f79f5825126d665480874634fd0ace;
        PythStructs.Price memory priceData = pyth.getPriceUnsafe(priceId);

        // forge-lint: disable-next-line(unsafe-typecast)
        uint ethPrice = uint(uint64(priceData.price)) * (10 ** uint256(-int256(priceData.expo)));
        usdValue = (amountWei * ethPrice) / 1e18;
    }
}
