//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//https://www.youtube.com/watch?v=PDR054Cy8qM&list=PLO5VPQH6OWdVQwpQfw9rZ67O6Pjfo6q-p&index=59
contract Event {
    event Log(string message, uint val);

    event IndexedLog(address indexed sender, uint val);

    function example() external {
        emit Log("foo", 1234);
        emit IndexedLog(msg.sender, 789);
    }

    event Message(address indexed _from, address indexed _to, string message);

    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}

contract TestMulticall {
    function func1() external view returns (uint, uint) {
        return (1, block.timestamp);
    }

    function func2() external view returns (uint, uint) {
        return (2, block.timestamp);
    }

    function getData1() external pure returns (bytes memory) {
        //abi.encodeWithSignature("func2()")
        return abi.encodeWithSelector(this.func1.selector);
    }

    function getData2() external pure returns (bytes memory) {
        //abi.encodeWithSignature("func2()")
        return abi.encodeWithSelector(this.func2.selector);
    }
}

contract MultiCall {
    function multiCall(address[] calldata targets, bytes[] calldata data)
        external
        view
        returns (bytes[] memory)
    {
        require(targets.length == data.length, "target length!= data length");
        bytes[] memory results = new bytes[](data.length);
        for (uint i; i < targets.length; i++) {
            // for sending txn, this whole function shoudnt be a view function and insteaf of below staticcall, use call
            (bool success, bytes memory result) = targets[i].staticcall(
                data[i]
            );
            require(success, "call failed");
            results[i] = result;
        }
        return results;
    }
}
