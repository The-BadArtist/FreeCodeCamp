function titleCase(str) {
  let allLow = str.toLowerCase();
  let wordList = allLow.split(" ");
  
  for(let i = 0; i < wordList.length; i++){
    wordList[i] = wordList[i][0].toUpperCase() + wordList[i].slice(1).toLowerCase();
  }
  
  return wordList.join(" ");
}

titleCase("I'm a little tea pot");