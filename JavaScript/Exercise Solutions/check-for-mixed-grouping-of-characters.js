let myString = "Eleanor D. Roosevelt";
let myRegex = /(Eleanor|Franklin) (([A-Z]\.?|[A-Z][a-z]+) )?Roosevelt/; // Change this line
let result = myRegex.test(myString); // Change this line
// After passing the challenge experiment with myString and see how the grouping works
console.log(result);