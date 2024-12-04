// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CustomToken is ERC20, Ownable{
    uint8 private _customDecimals;

   constructor(
        string memory name, 
        string memory symbol, 
        uint8 tokenDecimals,
        uint256 initialSupply, 
        address creator
    ) 
    ERC20(name, symbol)  
    Ownable(creator)   
    {
        _customDecimals = tokenDecimals;
        _mint(creator, initialSupply * (10 ** tokenDecimals));
    }

    function decimals() public view virtual override returns (uint8){
        return _customDecimals; 
    }
}
