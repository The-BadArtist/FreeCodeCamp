function palindrome(str) {
  let result = false;

  let test = str.trim()
  .replace(/\W|_|\s/gi, "")
  .toLowerCase()
  .split("");

  console.log(test)

  for(let i = 0, j = test.length - 1; i < test.length; i++, j--){
    console.log("i: " + test[i] + " j: " + test[j])
    result = (test[i] !== test[j]) ? false : true;
    if(result === false){
      break;
    }
  }
  
  return result;
}

