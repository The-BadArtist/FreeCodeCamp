function addTogether() {
  let arr = [...arguments];
  if(arr.some(element => typeof element !== 'number')){
    return undefined;
  } else if(arr.length === 1){
    return function addNum2(num2) {
      return addTogether(arr[0], num2)
    }
  } else {
    return arr.reduce((acc,sum) => acc + sum, 0);
  }
}

let x = addTogether(5)(7);
console.log(x)

