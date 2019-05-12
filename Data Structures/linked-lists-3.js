/* 
> Given an unsorted singly linked list, reverse it. Example Input: a -> b -> c -> d Output: d -> c -> b -> a
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
      while (current.next) {
        current = current.next;
      }
      current.next = node;
    }
    this.length++;
  }

  // print helper function
  print() {
    if (!this.head) return;
    let node = this.head;
    let i = 1;
    while (node.next != null) {
      console.log(`${i} - ${node.value}`);
      node = node.next;
      i++;
    }
    console.log(`${i} - ${node.value}`);
  }

  reverse() {
    if (!this.head) return null;
    if (!this.head.next) return this;

    let current = this.head;
    let previous = null;
    let next;

    while (current) {
      next = current.next;
      current.next = previous;
      previous = current;
      current = next;
    }
    this.head = previous;
  }
}

let list = new LinkedList();
list.push("a");
list.push("b");
list.push("c");
list.push("d");

list.reverse();
list.print();
