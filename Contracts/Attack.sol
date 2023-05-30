// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

//If u want get method id in solidity. This way!
contract Attack {
    address public owner;

    //0x31e12c20
    function getselector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }
    //0x31e12c20
    function getselector2(string memory _func) external pure returns (bytes4) {
        return bytes4(keccak256(abi.encodePacked(_func)));
    }
    //0x31e12c20
    function getselector3() public pure returns (bytes4) {
        return bytes4(keccak256("setowner()"));
    }
    //0x31e12c20
    function getselector4(string calldata str)public pure returns (bytes memory) {
        return abi.encodeWithSignature(str);
    }
    //0x31e12c2016ba462dc976fcb400de19bd7038394c3d8e3d2fe6964a6709ab5204
    function getselectorByBytes32(string memory _func) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(_func));
    }
}







