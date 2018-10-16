/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract MANHATTANPROXY8THAVE at 0xf3836dda23fcfccbe3f669ae7b3abe95a5e05fee
*/
pragma solidity ^0.4.4;

// ----------------------------------------------------------------------------------------------
// MANHATTAN:PROXY BY KEVIN ABOSCH �2018
// 8TH AVENUE (10,000 ERC-20 TOKENS)
// VERIFY SMART CONTRACT ADDRESS WITH LIST AT HTTP://MANHATTANPROXY.COM
// ----------------------------------------------------------------------------------------------


contract Token {

    
    function totalSupply() constant returns (uint256 supply) {}

    
    function balanceOf(address _owner) constant returns (uint256 balance) {}

    
    function transfer(address _to, uint256 _value) returns (bool success) {}

    
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {}

    
    function approve(address _spender, uint256 _value) returns (bool success) {}

   
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {}

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
}



contract StandardToken is Token {

    function transfer(address _to, uint256 _value) returns (bool success) {
        
        if (balances[msg.sender] >= _value && _value > 0) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        
        if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
            balances[_to] += _value;
            balances[_from] -= _value;
            allowed[_from][msg.sender] -= _value;
            Transfer(_from, _to, _value);
            return true;
        } else { return false; }
    }

    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }

    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
    uint256 public totalSupply;
}



contract MANHATTANPROXY8THAVE is StandardToken {

    function () {
       
        throw;
    }

    

    
    string public name;                   
    uint8 public decimals;                
    string public symbol;                 
    string public version = 'H1.0';       


    function MANHATTANPROXY8THAVE (
        ) {
        totalSupply = 10000;                        
        balances[msg.sender] = 10000;               
        name = "MP8THAV";                                             
        decimals = 0;                            
        symbol = "MP8THAV";                               
    }

    /* Approves and then calls the receiving contract */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);

        
        if(!_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) { throw; }
        return true;
    }
}