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
