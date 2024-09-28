// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract MyToken {

    // Public variables to store the token details
    string public tokenName = "Solu Kumar";
    string public tokenAbbrv = "SOL";
    uint public totalSupply;

    // Mapping to store balances
    mapping(address => uint) public balances;

    // Mint function to increase total supply and the balance of the specified address
    function mint(address _to, uint _value) public {
        totalSupply += _value;
        balances[_to] += _value;
    }

    // Burn function to decrease total supply and the balance of the specified address
    function burn(address _from, uint _value) public {
        require(balances[_from] >= _value, "Insufficient balance to burn");
        totalSupply -= _value;
        balances[_from] -= _value;
    }
}
