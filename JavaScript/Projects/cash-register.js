//Cash value in pennies
let moneyUnits = {"ONE HUNDRED" : 10000,
"TWENTY" : 2000, 
"TEN": 1000,
"FIVE": 500,
"ONE" : 100,
"QUARTER" : 25,
"DIME": 10,
"NICKEL": 5,
"PENNY": 1
}


function checkCashRegister(price, cash, cid) {
  let change = cash * 100 - price * 100;
  let cidTotal = 0;
  for(let elem of cid){
    cidTotal += elem[1]*100;
  }
  if(change > cidTotal){
    return {status: "INSUFFICIENT_FUNDS", change: []};  //Compares the total to Cash Register Total
  } else if(change === cidTotal){
    return {status: "CLOSED", change: cid};
  } else {
    cid = cid.reverse();
    let answer = [];
    for(let elem of cid){       //Iterates through the cash register and deducts to corresponding money units
      let holder = [elem[0], 0]
      elem[1] = elem[1] * 100;
      while(change >= moneyUnits[elem[0]] && elem[1] > 0){
        change -= moneyUnits[elem[0]];
        elem[1] -= moneyUnits[elem[0]];
        holder[1] += moneyUnits[elem[0]]/100; //Converts them from pennies to original values
      }
      if(holder[1] > 0){
      answer.push(holder);
      }
    }
    if(change > 0){
      return {status: "INSUFFICIENT_FUNDS", change: []};
    }
     return {status: "OPEN", change: answer}
  }
  
}

let x = checkCashRegister(19.5, 20, [["PENNY", 1.01], ["NICKEL", 2.05], ["DIME", 3.1], ["QUARTER", 4.25], ["ONE", 90], ["FIVE", 55], ["TEN", 20], ["TWENTY", 60], ["ONE HUNDRED", 100]])

console.log(x);

