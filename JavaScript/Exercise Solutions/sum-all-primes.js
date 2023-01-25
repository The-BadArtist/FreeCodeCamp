function sumPrimes(num) {
  let sum = 0;

  function isPrime(number){
    for(let i = 2; i < number; i++){
      if(number % i == 0) return false;
    }
    return true;

  }


  for(let i = 2; i <= num; i++){
    if(isPrime(i)) sum += i;
  }
  return sum;
}

let x = sumPrimes(10);
console.log(x)