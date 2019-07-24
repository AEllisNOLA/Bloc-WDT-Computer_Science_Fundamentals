/* 
Create a hash table that allows a store owner to track their store's inventory and quantity.
*/

// CREATE HASH TABLE
class HashTable {
  constructor(size = 23) {
    this.keyMap = new Array(size);
  }

  _hash(itemNumber) {
    let total = 0;
    let prime = 23;
    for (let i = 0; i < itemNumber.length; i++) {
      let char = itemNumber[i];
      let value = char.charCodeAt(0);
      total = (total * prime + value) % this.keyMap.length;
    }
    return total;
  }

  set(itemNumber, itemDescription, inventory) {
    let index = this._hash(itemNumber);

    if (!this.keyMap[index]) {
      this.keyMap[index] = [];
    }
    this.keyMap[index].push([itemNumber, itemDescription, inventory]);
  }

  get(itemNumber) {
    let index = this._hash(itemNumber);
    // if there is anything at that index
    if (this.keyMap[index]) {
      // move through all items in that index, whether there be 1 or multiple due to collision
      for (let i = 0; i < this.keyMap[index].length; i++) {
        // once the number is found
        if (this.keyMap[index][i][0] === itemNumber) {
          let number = this.keyMap[index][i][0];
          let itemDescription = this.keyMap[index][i][1];
          let inventory = this.keyMap[index][i][2];
          // return all info
          return `Description: ${itemDescription} - Item Number: ${number} - In Stock: ${inventory}`;
        }
      }
    }
    return `Item Number ${itemNumber} not found`;
  }
}

let storeInventory = new HashTable();



storeInventory.set("12421", "Basketball", "8");
storeInventory.set("12422", "Soccer Ball", "4");
storeInventory.set("12423", "Football", "12");


console.log(storeInventory.get("12421"));
console.log(storeInventory.get("12422"));
console.log(storeInventory.get("12423"));
console.log(storeInventory.get("12424"));
