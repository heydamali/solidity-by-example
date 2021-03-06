// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base {
    uint public num;
    address public sender;
    
    function setNum(uint _num) public {
        num = _num;
        sender = msg.sender;
    }
}

contract FirstCaller{
    uint public num;
    address public sender;
    
    function setBaseNum(address _base, uint _num) public {
        Base baseContract = Base(_base);
        baseContract.setNum(_num);
    }
    
    function callSetNum(address _base, uint _num) public {
        (bool status, bytes memory returnData) = _base.call(abi.encodeWithSignature("setNum(uint256)", _num));
    }
    
    function delegatecallSetNum(address _base, uint _num) public {
        (bool status, bytes memory returnData) = _base.delegatecall(abi.encodeWithSignature("setNum(uint256)", _num));
    }
}

contract SecondCaller {
    function callThrough(FirstCaller _fc, Base _base, uint _num) public {
        _fc.delegatecallSetNum(address(_base), _num);
    }
}
