// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract WillThrow {
    error NotAllowedError(string);
    function aFunction() public pure  {
        require(false, "error message1");
        assert(false);
        revert NotAllowedError("error message2");

    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogBytes(bytes lowLevelData);

    function catchTheError() public {
        WillThrow will = new WillThrow();
        
        try will.aFunction() {
            // add code here if works
        } catch Error(string memory reason) {
            emit ErrorLogging(reason);
        } catch Panic(uint errorCode) {
        emit ErrorLogCode(errorCode);   
        } catch (bytes memory lowLevelData) {
            emit ErrorLogBytes(lowLevelData);
        }
    }
}



// ini relatif lebih murah ketimbang modifier + require

// error NotOwner(address caller);

// modifier onlyOwner() {
//     if (msg.sender != owner) {
//         revert NotOwner(msg.sender);
//     }
//     _;
// }


// kalo tanpa deklarasi diawal seperti error NotOwner, itu akan relatif lebih mahal lebih baik require

// contoh yang mahal
// function withdraw(uint amount) public {
//     if (msg.sender == owner) {
//         payable(owner).transfer(amount);
//     } else if (msg.sender != owner) {
//         revert("Gagal: Bukan pemilik"); // ini mahal
//     }
// }