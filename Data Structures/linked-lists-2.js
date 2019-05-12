/* 
> Given an unsorted singly linked list, remove all duplicates from the linked list.
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

  removeDuplicates() {
    if (!this.head || !this.head.next) return this;

    let nodes = {};
    let i = this.head;
    let j = i.next;
    nodes[i.value] = true;

    while (j) {
      let value = j.value;
      if (nodes[value]) {
        i.next = j.next;
        this.length--;
      } else {
        nodes[value] = true;
        i = j;
      }
      j = j.next;
    }
  }
}

let list = new LinkedList();
list.push("a");
list.push("c");
list.push("d");
list.push("d");
list.push("a");

console.log("Before removeDuplicates() called");
list.print();

list.removeDuplicates();
console.log("After removeDuplicates() called");
list.print();
