pragma solidity ^0.4.17;

contract Adoption {
  address[16] public adopters;

  event AdoptEvent(uint indexed petId, address indexed sender);
  
  function adopt(uint petId) public returns (uint) {
    require(petId >= 0 && petId <= 16, "Enter a valid petID between 0 and 16.");
    require(adopters[petId] != msg.sender, "You've already adopted this pet.");
    require(adopters[petId] == address(0), "The pet you've selected already has a Owner.");

    
    
    emit AdoptEvent(petId, msg.sender);
    
    adopters[petId] = msg.sender;
    return petId;
  }

  function getAdopters() public view returns (address[16]) {
    return adopters;
  }
}
