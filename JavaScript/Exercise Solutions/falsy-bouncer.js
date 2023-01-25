function bouncer(arr) {
  let filteredArr = [];
  for(let i = 0; i < arr.length; i++){
    if(arr[i]){
      filteredArr.push(arr[i]);
    }
  }
  
  return filteredArr;
}

console.log(bouncer([7, "ate", "", false, 9]));

