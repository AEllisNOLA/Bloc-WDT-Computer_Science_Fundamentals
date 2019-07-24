/*
Create a hash table that allows a sales associate to enter a customer's name, 
address, and phone number into the system and look up customers using their 
phone numbers.
*/

// CREATE HASH TABLE
class HashTable {
    // make size a prime number for less collisions
    constructor(size = 23) {
      this.keyMap = new Array(size);
    }
  
    _hash(phoneNumber) {
      // initial character code value
      let total = 0;
      // multiplying by a prime number helps to avoid collisions
      let prime = 23;
      // loop through every character of the phone number
      for (let i = 0; i < phoneNumber.length; i++) {
        let char = phoneNumber[i];
        // each character has a value
        let value = char.charCodeAt(0);
  
        // updated total of all characters in the key/phone number times PRIME modded by 23
        total = (total * prime + value) % this.keyMap.length;
      }
      return total;
    }
  
    set(phoneNumber, name, address) {
      let index = this._hash(phoneNumber);
      // if index is empty, add the key/values into an array at that spot
      if (!this.keyMap[index]) {
        this.keyMap[index] = [];
      }
      // if collision occurs, add the key/value pairs into that nested array
      this.keyMap[index].push([phoneNumber, name, address]);
    }
  
    get(phoneNumber) {
      let index = this._hash(phoneNumber);
      // if there is anything at that index
      if (this.keyMap[index]) {
          // move through all items in that index, whether there be 1 or multiple due to collision
        for (let i = 0; i < this.keyMap[index].length; i++) {
            // once the number is found
          if (this.keyMap[index][i][0] === phoneNumber) {
            let number = this.keyMap[index][i][0];
            let name = this.keyMap[index][i][1];
            let address = this.keyMap[index][i][2];
            // return all info
            return `${name} - ${address} - ${number}`;
          }
        }
      }
      return `${phoneNumber} not found`;
    }
  }
  
  let customers = new HashTable(17);
  customers.set("999-999-9999", "Saint", "15 Doggo Lane");
  customers.set("111-111-1111", "Kelis", "9 Meow Street");
  console.log(customers.get("999-999-9999"));
  console.log(customers.get("111-111-1111"));
  console.log(customers.get("123-456-7890"));
  