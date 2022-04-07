// SPDX-License-Identifier: Unlicense
pragma solidity 0.8.10;

import "ds-test/test.sol";
import "../StakeContract.sol";
import "./mocks/MockERC20.sol";
import "./utils/Cheats.sol";


contract StakeContractTest is DSTest {
    Cheats internal constant cheats = Cheats(HEVM_ADDRESS);
    StakeContract public stakeContract;
    MockERC20 public mockToken; 

    function setUp() public {
        stakeContract = new StakeContract();
        mockToken = new MockERC20();
    }

    function testExample(uint8 amount) public {
        mockToken.approve(address(stakeContract), amount);
        bool stakePassed = stakeContract.stake(amount, address(mockToken));
        cheats.roll(55);
        assertTrue(stakePassed);
    }
}