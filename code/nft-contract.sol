// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract HEXNFTCOLLECTION is ERC1155, Ownable {
    string url = "https://raw.githubusercontent.com/lukas-becker/NFT-Tests/master/metadata/";

    constructor()
        ERC1155("https://raw.githubusercontent.com/lukas-becker/NFT-Tests/master/metadata/{id}.json")
    {
        _mint(msg.sender, 1, 1, "");
        _mint(msg.sender, 2, 1, "");
        _mint(msg.sender, 3, 1, "");
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function uri(uint256 _tokenID) override public view returns (string memory) {
        return string(
            abi.encodePacked(
                url,
                Strings.toString(_tokenID),
                ".json"
            )
        );
    }   
}
