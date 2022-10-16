
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract myBond is ERC1155 {

    uint256 public constant GOLD = 0;
    uint256 public constant SILVER = 1;
    uint256 public constant THORS_HAMMER = 2;
    uint256 public constant SWORD = 3;
    uint256 public constant SHIELD = 4;
     mapping (uint256 => person) public users;
    constructor() ERC1155("https://game.example/api/item/{id}.json") {
        _mint(msg.sender, GOLD, 10**18, "");
        _mint(msg.sender, SILVER, 10**27, "");
        _mint(msg.sender, THORS_HAMMER, 1, "");
        _mint(msg.sender, SWORD, 10**9, "");
        _mint(msg.sender, SHIELD, 10**9, "");
        users[0].id = 1;
        users[0].age = 35;

    }
    function getGold() external returns(uint256) {
        return GOLD;
    }
     function getPerson(uint256 id) external view returns(person memory ) {
        address addr;
        //addr.call(abi.encodeWithSelector(bytes4(keccak256("transfer(address,uint256")),msg.sender));
        return users[id];
    }
    struct person {
        uint256 id;
        uint256 age;
    }
    function Redeem  (uint bondunits, uint bondId) external{

        //require user has the correct balance 
        //require the bond has reached maturity date 
        //error handling
        //burn
        //update user balance 
        //sent bond owner principal + profit (separate function)
        //Reserve 
        //Scaling solution (allow user to issue own bonds thorough this contract)


    }
    function BuyBond (uint bondunits, uint bondId) external {

        //mint 
        //Grading the bonds 
        //update user balance 
        //Timelock? (BondBank)
        //If address(this).balance == x ether....payable(BondPoolone).transfer 
        //emit event (mint, transfer)

    } 
    

}