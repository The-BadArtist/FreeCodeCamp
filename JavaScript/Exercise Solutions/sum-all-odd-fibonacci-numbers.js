function sumFibs(num) {
  let prev = 0
  let curr = 1;
  let sumOfOdd = 0;

  while(curr <= num){
    if(curr % 2 != 0){
      sumOfOdd += curr;
    }

    curr += prev;
    prev = curr - prev;
  }

  return sumOfOdd;
}

let x = sumFibs(1000);

console.log(x);