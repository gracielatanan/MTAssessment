// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MintToken is ERC20 {
    address public owner;

    constructor() ERC20("MintToken", "MTK") {
        owner = msg.sender;
        _mint(msg.sender, 2000000 * 10 ** decimals()); // Mint 2,000,000 tokens initially
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        return super.transfer(recipient, amount);
    }

    function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
        return super.transferFrom(sender, recipient, amount);
    }
}
