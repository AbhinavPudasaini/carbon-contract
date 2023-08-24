// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.19;

import { ERC20 } from "./ERC20.sol";
import { ERC20Permit } from "./ERC20PermitUpgradeable.sol";

contract TestERC20Token is ERC20Permit {
    uint8 private _decimals = 18;

    constructor(string memory name, string memory symbol, uint256 totalSupply) ERC20(name, symbol) ERC20Permit(name) {
        _mint(msg.sender, totalSupply);
    }

    function decimals() public view virtual override returns (uint8) {
        return _decimals;
    }

    function updateDecimals(uint8 newDecimals) external {
        _decimals = newDecimals;
    }
}
