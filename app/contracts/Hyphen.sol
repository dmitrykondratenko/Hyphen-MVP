pragma solidity ^0.4.4;

contract Hyphen {
  string creator;
  string ipfsHash;
  string createdAt;

  function set(string name, string location, string created) {
    creator = name;
    ipfsHash = location;
    createdAt = created;
  }

  function getHash() constant returns (string) {
    return ipfsHash;
  }

  function getCreator() constant returns (string) {
    return creator;
  }

  function getCreatedAt() constant returns (string) {
    return createdAt;
  }
}
