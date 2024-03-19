// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {
    struct RedeemableItem {
        string name;
        uint256 amount;
    }

    mapping(uint256 => RedeemableItem) public redeemableItems;
    uint256 public nextItemId;

    constructor() ERC20("Degen", "DGN") {}

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function addRedeemableItem(string memory name, uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        redeemableItems[nextItemId] = RedeemableItem(name, amount);
        nextItemId++;
    }

    function redeem(uint256 itemId) public {
        require(redeemableItems[itemId].amount > 0, "Invalid item ID");
        require(balanceOf(msg.sender) >= redeemableItems[itemId].amount, "Insufficient balance");
        
        _burn(msg.sender, redeemableItems[itemId].amount);
        redeemableItems[itemId].amount = 0; // Mark item as redeemed
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
