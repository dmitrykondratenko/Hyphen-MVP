pragma solidity ^0.4.4;

contract HyphenTwo {

  mapping (bytes32 => string) public registry;

  function register(bytes32 key, string value, bytes32 key2, string value2, bytes32 key3, string value3) {
    registry[key] = value;
    registry[key2] = value2;
    registry[key3] = value3;
  }

  function get(bytes32 key) public constant returns(string) {
    return registry[key];
  }

}
