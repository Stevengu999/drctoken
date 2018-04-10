pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';


/**
 * @title Autonomy
 * @dev Simpler version of an Democracy organization contract
 * @dev the inheritor should implement 'initialCongress' at first
 */
contract Autonomy is Ownable {
    address public congress;

    modifier onlyCongress() {
        require(msg.sender == congress);
        _;
    }

    /**
     * @dev initialize a Congress contract address for this token 
     *
     * @param _congress address the congress contract address
     */
    function initialCongress(address _congress) onlyOwner public {
        require(_congress != address(0));
        congress = _congress;
    }

    /**
     * @dev set a Congress contract address for this token
     * must change this address by the last congress contract 
     *
     * @param _congress address the congress contract address
     */
    function changeCongress(address _congress) onlyCongress public {
        require(_congress != address(0));
        congress = _congress;
    }
}