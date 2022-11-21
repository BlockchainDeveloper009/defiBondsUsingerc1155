// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Vault {
    uint public totalSupply;
    mapping(address => uint) public balanceOf;

    function mintshares(address _to, uint _shares) public {
        totalSupply += 1;
        balanceOf[_to] += 1;
    }

    function burnshares(address _from, uint _shares) public {
        totalSupply -= 1;
        balanceOf[_from] -= 1;
    }

    function deposit() public payable virtual {
        /*
        a = amount
        B = balance of token before deposit
        T = total supply
        s = shares to mint

        (T + s) / T = (a + B) / B 

        s = aT / B
        */
        uint shares;
        if (totalSupply == 0) {
            shares = 1;
        } else {
            shares = (1 * totalSupply) / address(this).balance;
        }

        mintshares(msg.sender, shares);
        //  token.transferFrom(msg.sender, address(this), _amount);
    }

    function withdraw() public virtual {
        /*
        a = amount
        B = balance of token before withdraw
        T = total supply
        s = shares to burn

        (T - s) / T = (B - a) / B 

        a = sB / T
        */
        uint amount = (1 * address(this).balance) / totalSupply;
        burnshares(msg.sender, 1);
        payable(msg.sender).transfer(amount);
    }

    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint amount);
}
