// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;
import "./BaseContract.sol";

contract MyContractV1  is BaseContract {

 uint256 public myValue;
 uint256 public myValue1;
 
    event Logmyvalue(uint256 value);
    event LogmStr(string str);
    event LogAll(address addr, uint256 value, string str, uint256 value1,uint256 value50);
    
    function setValue(uint256 _myValue) public payable  {
        myValue = _myValue;
    }

    function setValue1(uint256 _myValue) public payable  {
        myValue1 = _myValue;
    }

    ////
    function amyValue() external view returns (uint256) {
     return myValue;
    }

    function aamyValue() external payable  {
     emit Logmyvalue(myValue);   
    }

    function tfunction() external payable  {
     emit LogmStr("tfunction");
     emit LogAll(implementationAddress , myValue, "tfunction",myValue1,1);
    }
}
