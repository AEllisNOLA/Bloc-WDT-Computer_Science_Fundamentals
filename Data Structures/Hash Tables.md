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