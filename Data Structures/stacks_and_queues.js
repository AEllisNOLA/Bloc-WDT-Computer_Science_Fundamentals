
reverse = word => {
  let stack = [];
  let reversedWord = [];
  for (let char in word) {
    stack.push(word.charAt(char));
  }
  while (stack.length > 0) {
    let reversedLetter = stack.pop();
    reversedWord.push(reversedLetter);
  }
  return reversedWord.join("");
};
