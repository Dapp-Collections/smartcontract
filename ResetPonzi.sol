/* 
 source code generate by Bui Dinh Ngoc aka ngocbd<buidinhngoc.aiti@gmail.com> for smartcontract ResetPonzi at 0x3ab274f835d1939d20d0bbb72a1fb513d7a7a675
*/
contract ResetPonzi {

  struct Person {
      address addr;
  }

  struct NiceGuy {
      address addr;
  }

  Person[] public persons;
  NiceGuy[] public niceGuys;

  uint public payoutIdx = 0;
  uint public currentNiceGuyIdx = 0;
  uint public investor;

  address public currentNiceGuy;


  function ResetPonzi() {
    currentNiceGuy = msg.sender;
  }


  function() {
    enter();
  }


  function enter() {
    if (msg.value != 9 ether) {
        throw;
    }


    if (investor < 9) {
        uint idx = persons.length;
        persons.length += 1;
        persons[idx].addr = msg.sender;
        investor += 1;
    }

    if (investor >= 9) {
        uint ngidx = niceGuys.length;
        niceGuys.length += 1;
        niceGuys[ngidx].addr = msg.sender;
        investor += 1;
    }

    if (investor == 10) {
        currentNiceGuy = niceGuys[currentNiceGuyIdx].addr;
        investor = 0;
        currentNiceGuyIdx += 1;
    }

    if (idx != 0) {
	  currentNiceGuy.send(1 ether);
    }


    while (this.balance > 10 ether) {
      persons[payoutIdx].addr.send(10 ether);
      payoutIdx += 1;
    }
  }
}