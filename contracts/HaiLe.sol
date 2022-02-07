pragma solidity ^0.8.2;

contract HaiLe {
    mapping(address => uint256) public balances;

    mapping(address => mapping(address => uint256)) public allowance;

    uint256 public totalSupply = 1000 * 10**12;
    string public name = "HaiLeCoin";
    string public symbol = "HLE";
    uint256 public decimals = 9;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    // run when the contract is deployed
    constructor() {
        balances[msg.sender] = totalSupply;
    }

    function balanceOf(address owner) public view returns (uint256) {
        return balances[owner];
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf(msg.sender) >= value, "Insufficient funds");
        balances[to] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) public returns (bool) {
        require(balanceOf(from) >= value, "Insufficient funds");
        require(allowance[from][msg.sender] >= value, "Insufficient funds");
        balances[to] += value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
}
