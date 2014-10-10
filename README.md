---
  tags: logic, comparisons, object orientation, arrays, bitwise operators, advanced
  language: ruby
  resources: 2
---

# Allergies

An allergy test produces a single numeric score which contains the information about all the allergies the person has (that they were tested for).

The list of items (and their value) that were tested are:

* eggs (1)
* peanuts (2)
* shellfish (4)
* strawberries (8)
* tomatoes (16)
* chocolate (32)
* pollen (64)
* cats (128)

So if Tom is allergic to peanuts and chocolate, he gets a score of 34.

Now, given just that score of 34, your program should be able to say:

- Whether Tom is allergic to any one of those allergens listed above.
- All the allergens Tom is allergic to.

## How can we solve this?

Notice how each allergen's score is a power of 2. We can use bitflagging to work with binaries and determine from the binary of the score value which allergens make up that score.

Let's say the score is 34. `score.to_s(2)` turns the score into a binary string:

```ruby
score.to_s(2) 

#=> 100010
```

The first 1 is chocolate, the second 1 is peanuts. 32 + 2 = 34.

You can use [Ruby bitwise operators](http://calleerlandsson.com/2014/02/06/rubys-bitwise-operators/) to see if an allergen's bit is "active" (a part of the score) or not.

## Resources
* [Ruby's bitwise operators Calle Erldansson's Blog](http://calleerlandsson.com/) - [Ruby's bitwise operators](http://calleerlandsson.com/rubys-bitwise-operators)
* [Ruby Docs](http://www.ruby-doc.org/) - [Arrays](http://www.ruby-doc.org/core-2.1.1/Array.html)
