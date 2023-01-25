function convertToRoman(num) {
 let romanL = {
   "M" : 1000,
   "CM" : 900,
   "D" : 500,
   "CD" : 400,
   "C" : 100,
   "XC" : 90,
   "L" : 50,
   "XL" : 40,
   "X" : 10,
   "IX" : 9,
   "V" : 5,
   "IV" : 4,
   "I" : 1 
 }, romanNumber = "";

  for(let i in romanL) {
    while(num >= romanL[i]){
      romanNumber += i
      num -= romanL[i];
    }
  }

 return romanNumber;
}

let x = convertToRoman(2);

console.log(x)