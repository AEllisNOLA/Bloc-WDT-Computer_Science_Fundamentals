> What is a hash table?

A hash table is a data structure that stores items in key-value pairs, and then places that set in an array.

> What is hashing?

Arrays are indexed by integers. In order to be placed in an array, a key (likely a string value type) 1) needs to be unique and 2) needs to be assigned an integer value. 

Hashing assigns the key a large interger that is unlikely to be a repeated value. When the key needs to be pulled up, that large integer is searched for and the key-value pair will be at that spot.

> How does a hash table store data?

A hash table stores data in an array. Even though the assigned hash value to a key-value pair is a large integer, you can divide it by the number of elements in the array at hand to find its "true value" so that a smaller array with the value of _x_ can be used rather than a million item array.

> How are hash tables and objects different?

They are similar in that they both utilize key-value pairs. However, hash tables are intended to use the same datatype, more like an _array_ than an _object_.

An object can be the _value_ part of the key-value pair in a hash table, but the _key_ is always of the same datatype.

> Determine whether you would use a hash table or an object to store each of the following pieces of data:

* A list of pets and their unique names.

Hash Table

* The name, age, and the birthday of your best friend.

Object

* The name and location of every company in a given city.

Hash Table

* All of the books checked out from a library by a particular individual.

Hash Table

* The primary and secondary phone numbers for a contact.

Object

> Create a hash table that allows a sales associate to enter a customer's name, address, and phone number into the system and look up customers using their phone numbers.

```
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
            return `Name: ${name} - Address: ${address} - Phone Number: ${number}`;
          }
        }
      }
      return `Phone number ${phoneNumber} not found`;
    }
  }
  
  let customers = new HashTable();
  customers.set("999-999-9999", "Saint", "15 Doggo Lane");
  customers.set("111-111-1111", "Kelis", "9 Meow Street");
  console.log(customers.get("999-999-9999"));
  console.log(customers.get("111-111-1111"));
  console.log(customers.get("123-456-7890"));
  
```

> Create a hash table that allows a store owner to track their store's inventory and quantity.

```
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

```

> Create a hash table that allows digital copies of newspapers to be entered and searched by publisher and publication date.

```
/* 
Create a hash table that allows digital copies of newspapers to be entered and searched by publisher and publication date.
*/

// CREATE HASH TABLE
class HashTable {
  constructor(size = 23) {
    this.keyMap = new Array(size);
  }

  _hash(newspaper) {
    let total = 0;
    let prime = 23;
    for (let i = 0; i < newspaper.length; i++) {
      let char = newspaper[i];
      let value = char.charCodeAt(0);
      total = (total * prime + value) % this.keyMap.length;
    }
    return total;
  }

  set(newspaper, publisher, publicationDate) {
    let index = this._hash(newspaper);

    if (!this.keyMap[index]) {
      this.keyMap[index] = [];
    }
    this.keyMap[index].push([newspaper, publisher, publicationDate]);
  }

  get(newspaper) {
    let index = this._hash(newspaper);
    if (this.keyMap[index]) {
      for (let i = 0; i < this.keyMap[index].length; i++) {
        if (this.keyMap[index][i][0] === newspaper) {
          let paper = this.keyMap[index][i][0];
          let publisher = this.keyMap[index][i][1];
          let publicationDate = this.keyMap[index][i][2];
          return `Newspaper: ${paper} - Publisher: ${publisher} - Publication Date: ${publicationDate}`;
        }
      }
    }
    return `${newspaper} was not found.`;
  }
}

let newspaperDirectory = new HashTable();

newspaperDirectory.set("USA Today", "Garnnett Company", "December 12, 1967");
newspaperDirectory.set("The New York Times", "The New York Times Company", "November 12, 1882");
newspaperDirectory.set("Chicago Tribune", "Tribune Company", "July 12, 1892");

console.log(newspaperDirectory.get("USA Today"));
console.log(newspaperDirectory.get("The New York Times"));
console.log(newspaperDirectory.get("Chicago Tribune"));
console.log(newspaperDirectory.get("The Bloc Bugle"));

```