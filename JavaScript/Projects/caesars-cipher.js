function rot13(str) {
  let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  let answer = "";
  for(let i = 0; i < str.length; i++){
    let letter = alphabet.indexOf(str[i]);
    if(letter == -1){
      answer += str[i]; 
    } else {
      let shiftIndex = (letter + 13) % 26;
      answer += alphabet[shiftIndex]
    }
  }
  console.log(answer);
  return answer;
}

rot13("SERR PBQR PNZC");