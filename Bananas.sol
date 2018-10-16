/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract Bananas at 0x2405cc17ba128bfa7117815e04a4da228013f5bc
*/
pragma solidity ^0.4.8;
contract ERC20Interface {
    function totalSupply() constant returns (uint256 totalSupply);
    function balanceOf(address _owner) constant returns (uint256 balance);
    function transfer(address _to, uint256 _value) returns (bool success);
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success);
    function approve(address _spender, uint256 _value) returns (bool success);
    function allowance(address _owner, address _spender) constant returns (uint256 remaining);
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract Bananas is ERC20Interface {
    string public name;
    string public symbol;
    uint8 public decimals;
    address public owner;
    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;
    uint256 _totalSupply;
    modifier onlyOwner() { if (msg.sender != owner) { throw; } _; }
    function Bananas() { owner = msg.sender; name = "Bananas"; symbol = "BNN"; decimals = 8; _totalSupply = 200160000000000; balances[owner] = _totalSupply; }
	function totalSupply() constant returns (uint256 totalSupply) { totalSupply = _totalSupply; }
    function balanceOf(address _owner) constant returns (uint256 balance) { return balances[_owner]; }
    function transfer(address _to, uint256 _amount) returns (bool success) { if (balances[msg.sender] >= _amount && _amount > 0) { balances[msg.sender] -= _amount; balances[_to] += _amount; Transfer(msg.sender, _to, _amount); return true; } else { return false; } }
	function transferFrom(address _from, address _to, uint256 _amount) returns (bool success) { if (balances[_from] >= _amount && allowed[_from][msg.sender] >= _amount && _amount > 0) { balances[_to] += _amount; balances[_from] -= _amount; allowed[_from][msg.sender] -= _amount; Transfer(_from, _to, _amount); return true; } else { return false; } }
    function approve(address _spender, uint256 _amount) returns (bool success) { allowed[msg.sender][_spender] = _amount; Approval(msg.sender, _spender, _amount); return true; }
	function allowance(address _owner, address _spender) constant returns (uint256 remaining) { return allowed[_owner][_spender]; }
    function () { throw; }
}