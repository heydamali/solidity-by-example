// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract Base {
    uint x;
    
    constructor() public {
        x = 10;
    }
    
    function setX(uint _x) public returns (bool) {
        x = _x;
        return true;
    }
    
    function getX() public view returns (uint) {
        return x;
    }
}

contract Caller {
    
    function getBaseX(address baseAddress) public view returns (uint) {
        require(baseAddress != address(0), 'Enter a valid address.');
        Base baseContract = Base(baseAddress);
    
        return baseContract.getX();
    }
}
