# DeganToken

DegenToken is an ERC20 token called "Degen" with the symbol "DGN" that is implemented using Solidity smart contract. The contract adds functionality for minting, transferring, approving, redeeming, checking balance, and burning tokens to the OpenZeppelin ERC20 contracts.

## Steps
* Create the ERC-20 token
* Set the name to “Degen”
* Set the symbol to “DGN”
* Test the smart-contract (All tests should pass)
* Deploy the contract to Avalanche Fuji Testnet
* Test on testnet (All tests should pass)
* Verify the smart-contract on Snowtrace
  
## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file 
```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {
    constructor() ERC20("Degen", "DGN") {}

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function redeem(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }

    function burn(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }

    function balanceOf(address account) public view override returns (uint256) {
        return super.balanceOf(account);
    }
}



```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile HelloWorld.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar.

Once the contract is deployed, you can interact with it by calling functions.

## Steps
* Import OpenZeeplin
* Write ERC Contract.
* Compile the Contract
* On Deployment tab selct injectet metamsk.
* Connect Your Remix with Metamask
* Get Some tokens For testing on chainlink.org
* Connect your Metamask wallet with Avalanche C-Chain network
* Try calling Functions
* Transactions will be reflected on Snowtrace

  
## You can verify also I am providing Qr code and Screenshot of Deplyed contract on testnet
![Screenshot (183)](https://github.com/Golu-1234/ETH-AVAX-MOD4/assets/161577973/a8e25444-0ecb-4c94-8907-e50b7c611da3)
![Screenshot (185)](https://github.com/Golu-1234/ETH-AVAX-MOD4/assets/161577973/92325619-2f30-44b9-8ab8-4b21d016b351)

Searching Using Transaction Hash
 ![Screenshot (186)](https://github.com/Govi451/ETH-AVAX-MOD4/assets/113189162/9156337b-aef3-400d-99d9-1798e8ce24d2)

## License

This project is licensed under the MIT License.
