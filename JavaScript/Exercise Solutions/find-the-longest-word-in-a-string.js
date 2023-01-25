function findLongestWordLength(str) {
  const comp = str.split(" ");
  let wordLength = 0;
  let i;

  console.log();

  for (i = 0; i < comp.length; i++) {
    let cLength = comp[i].length;
    if (cLength > wordLength) {
      wordLength = cLength;
    }
  }

  return wordLength;
}

findLongestWordLength("The quick brown fox jumped over the lazy dog");