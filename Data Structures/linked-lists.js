/* 
> The linked list push function should take a value, create a node, and add it to the end of a list. Below is pseudocode for a push function for a singly linked list. However, there is something wrong with it. Submit both an explanation of the bug and a functional implementation of the method.
*/


/* 
PROVIDED PSEUDOCODE:
  
FUNCTION push(element)
  CREATE node
  SET node.value TO element
  SET node.next TO null

  IF the head node does not exist
    THEN SET head to node
  ELSE
    SET current to head
    SET current.next to node
  END IF
END FUNCTION
*/

/* 
ANSWER: The provided code does not have a looping function that moves it along until there are no _next_ elements in the list. Also, though not strictly necessary, I added a length property to the linked list class and incremented it with each element that is pushed.
*/

// Class to create new node
class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

// Class to create new, empty inked List
class LinkedList {
  constructor() {
    this.head = null;
    this.length = 0;
  }

  push(value) {
    let node = new Node(value);

    if (!this.head) {
      this.head = node;
    } else {
      let current = this.head;
      // ADDED CODE: WHILE there is a next value to jump to, jump to it
      while (current.next) {
        current = current.next
      }
      current.next = node;
    }
    // ADDED CODE: Increment length
    this.length++;
  }
}

let list = new LinkedList();
list.push("A");
list.push("B");
console.log(list);
