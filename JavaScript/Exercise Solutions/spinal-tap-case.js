function spinalCase(str) {
  return str
  .replace(/([a-z])([A-Z])/g, "$1 $2")
  .replace(/\s|_/g, "-")
  .toLowerCase();
}

let x = spinalCase('This Is Spinal Tap');
let y = spinalCase("AllThe-small Things")
console.log(y);