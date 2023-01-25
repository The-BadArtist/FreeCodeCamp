function findSCM(num1, num2) {
  let lowNum = Math.min(num1, num2);
  let highNum = Math.max(num1, num2);
  for(let i = highNum; i <= highNum * lowNum; i += highNum) {
    if(i % lowNum === 0){
      return i;
    }
  }
}

function smallestCommons(arr) {
  const [min, max] = arr.sort((a, b) => a - b);
  let SCM = findSCM(...arr);

  for(let j = min; j <= max; j++){
    if(SCM % j !== 0){
      SCM = findSCM(SCM, j);
    }
  }

  return SCM;
}

smallestCommons([1,5]);