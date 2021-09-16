pragma solidity ^0.8.3;

contract Counter {
  uint public count;

  function get() public return (uint) {
    return count;
  }

  function inc() public {
    count += 1;
  }

  function dec() public {
    count -= 1;
  }
}
