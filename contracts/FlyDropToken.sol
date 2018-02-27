pragma solidity ^0.4.18;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';

interface itoken {
    function transferMultiAddressFrom(address _from, address[] _toMulti, uint256[] _values) public returns (bool);
}

contract FlyDropToken is Ownable {
    // uint256 private m_rate = 1e18;

    // function initialize(address _tokenAddr, address _tokenOwner, uint256 _amount) onlyOwner public {
    //     require(_tokenAddr != address(0));
    //     require(_tokenOwner != address(0));
    //     require(_amount > 0);
    //     m_token = DRCTestToken(_tokenAddr);
    //     m_token.approve(this, _amount.mul(m_rate));
    //     m_tokenOwner = _tokenOwner;
    // }
    
    function multiSend(address _tokenAddr, address _tokenOwner, address[] _destAddrs, uint256[] _values) onlyOwner public returns (bool) {
        assert(_destAddrs.length == _values.length);

        return itoken(_tokenAddr).transferMultiAddressFrom(_tokenOwner, _destAddrs, _values);
    }
}