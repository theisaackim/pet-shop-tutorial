pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoptions.sol";

contract TestAdoption {
    // address of adoption contract to be tested:
    Adoption adoption = Adoption(DeployedAddresses.Adoption());

    // ID of ped that will bed tested
    uint expectedPetId = 8;

    // Expecte owner of pet:
    address expectedAdopter = address(this);

    // test the adopt() function
    function testUserCanAdoptPet() public {
        uint returnedId = adoption.adopt(expectedPetId);

        Assert.equal(returnedId, expectedPetId, "Adoption of expected pet should match return value");

    }

    // test retrieval of pet's owner:
    function testGetAdopterAddressById() public {
        address adopter = adoption.adopters(expectedPetId);

        Assert.equal(adopter, expectedAdopter, "Owner of expected pet should be this contract");

    }

    // get entire array of owners => pets:
    function testGetAdopterAddressByPetIdInArray() public {
        // store adopters in memory:
        address[16] memory adopters = adoption.getAdopters();

        Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of expected pet should be this contract");
    }
}