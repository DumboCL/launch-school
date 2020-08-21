# Preparing material for RB129 Written Assessment.

### Explane the following topics and give the sample codes:

1. Classes and objects
class: 
* classes are basic outlines of what an object should be made of and what it should be able to do.

objects: 
* Everything in Ruby is Object
* Methods and blocks are not Objects
* Objects are created from classes

```ruby
class GoodDog; end

sparky = GoodDog.new
```
* In the above example, we created an instance of our GoodDog class and stored it in the variable sparky. 
* We now have an object. We say that sparky is an object or instance of class GoodDog. 
* This entire workflow of creating a new object or instance from a class is called instantiation, so we can also say that we've instantiated an object called sparky from the class GoodDog.
* An object is returned by calling the class method `new`


2. Use attr_* to create setter and getter methods

*   How to call setters and getters
*   Instance methods vs. class methods
*   Referencing and setting instance variables vs. using getters and setters
*   Class inheritance, encapsulation, and polymorphism
*   Modules
*   Method lookup path
*   self
    *   Calling methods with self
    *   More about self
*   Reading OO code
*   Fake operators and equality
*   Truthiness
*   Working with collaborator objects

