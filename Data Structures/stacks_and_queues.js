// 1
/* 
Given a string, reverse it using a stack. For example, the string "Bloc!" should be converted to "!colB".
*/

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

// 2
/* Implement the pop method of a stack using one queue. Make a FIFO data structure mirror the functionality of a LIFO 
data structure. Since the internal list is not the same as defined in the checkpoint, it may help to rewrite the 
pseudocode first.
*/

class Stack {
  constructor() {
    this.pop = function(queue) {
      let newQueue = [];
      let toDelete = [];

      for (let i = 0; i < queue.length; i++) {
        if (i === queue.length - 1) {
          toDelete.push(queue[i]);
        } else {
          newQueue.push(queue[i]);
        }
      }
      return toDelete;
    };
  }
}

let corn = new Stack();

//3
/* 
To delete an item, take all of the elements in the queue one at a time and put them at the end of the queue, except 
for the last one which should be removed and returned. Implement the enqueue and dequeue methods defined in the 
checkpoint inside your own Queue class.
*/

class Queue {
  constructor() {
    this.list = [];
  }

  enqueue(item) {
    this.list.push(item);
  }

  dequeue() {
    if (this.list.length === 0) return null;
    return this.list.shift();
  }
}

let line = new Queue();
line.enqueue("A"); // A
line.enqueue("B"); // A B
line.enqueue("C"); // A B C
line.dequeue(); // B C - A removed
line.dequeue(); // C - B removed
line.dequeue(); // empty - C removed
console.log(line);
