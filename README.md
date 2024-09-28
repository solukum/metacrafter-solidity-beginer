# MyToken Smart Contract

This is a simple Solidity smart contract that represents a basic token system with mint and burn functionalities. The contract includes public variables for token details, a mapping for balances, and functions for minting and burning tokens.

## Requirements

1. The contract has public variables that store the details about the coin:
   - **Token Name**: My Token
   - **Token Abbreviation**: MTK
   - **Total Supply**: Starts at 0 but can be updated through minting and burning.

2. The contract maintains a mapping of addresses to token balances.

3. **Mint function**:
   - Takes an address and a value.
   - Increases the total supply by the specified value.
   - Increases the balance of the specified address by the same amount.

4. **Burn function**:
   - Takes an address and a value.
   - Decreases the total supply by the specified value.
   - Decreases the balance of the specified address by the same amount.
   - Requires the address to have a balance greater than or equal to the value to be burned.

## Solidity Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract MyToken {

    // Public variables to store the token details
    string public tokenName = "My Token";
    string public tokenAbbrv = "MTK";
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
```

## How It Works

- **Minting**: You can mint new tokens by calling the `mint` function, specifying an address and an amount. This increases the total supply and credits the balance of the recipient.
  
- **Burning**: You can burn tokens by calling the `burn` function, specifying an address and an amount. The function will ensure that the address has enough tokens to burn before deducting from both the total supply and the balance.

## License

This contract is licensed under the MIT License.
