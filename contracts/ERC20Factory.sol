// SPDX-License-Identifier : MIT

pragma solidity ^0.8.20;

import "./CustomToken.sol";

// @title: ERC20 Factory
// @author: Syed Rabeet
// @notice: This factory can be used to generate ERC20 tokens

contract ERC20Factory{

    // errors
    error EmptyTokenName();
    error EmptyTokenSymbol();
    error InvalidDecimals(uint8 tokenDecimals);

    //Events to log token creation with its details

    event TokenCreated(
        address indexed tokenAddress,
        string name,
        string symbol,
        uint8 tokenDecimals,
        address indexed creator
    );

    //This function will create a new ERC20 token

    function createToken(
        string memory name,
        string memory symbol,
        uint8 tokenDecimals,
        uint256 initialSupply
    ) public returns (address){
        if(bytes(name).length == 0){
            revert EmptyTokenName();
        }
        if(bytes(symbol).length == 0){
            revert EmptyTokenSymbol();
        }
        if(tokenDecimals == 0 || tokenDecimals > 18){
            revert InvalidDecimals(tokenDecimals);
        }

        CustomToken newToken = new CustomToken(
            name,
            symbol,
            tokenDecimals,
            initialSupply,
            msg.sender
        );

        //emitting the events with token details

        emit TokenCreated(
            address(newToken),
            name,
            symbol,
            tokenDecimals,
            msg.sender
        );

        return address(newToken);


    }























}

