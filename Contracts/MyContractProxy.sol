// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "./BaseContract.sol";

interface MyContractV1 {
    function amyValue() external view returns (uint256);
    function myValue() external view returns (uint256);
}

contract MyContractProxy is BaseContract {

 event ProxyLogmyvalue(uint256 value);
 event ProxyLog(string str);

    constructor(address _implementationAddress) {
        implementationAddress = _implementationAddress;
    }

    function upgrade(address _newImpl) public {
        implementationAddress = _newImpl;
    }

    function testContract(address addr) external view returns (uint256) {
        MyContractV1 contractAddr = MyContractV1(addr);
        return contractAddr.myValue();
    }

    fallback () external payable {
        address _impl = implementationAddress;
       
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize())
            let result := delegatecall(gas(), _impl, ptr, calldatasize(), 0, 0)
            let size := returndatasize()
            returndatacopy(ptr, 0, size)

            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }

    receive() external payable {
        //emit SafeReceived(msg.sender, msg.value);
    }
}