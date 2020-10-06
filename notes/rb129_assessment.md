# Preparing material for RB129 Written Assessment.

### Explane the following topics and give the sample codes:

1. Classes and objects
    - class:
        - classes are basic outlines of what an object should be made of and what it should be able to do.
        - Think of classes as molds and objects as the things you produce out of those molds.
    - objects: 
        - Everything in Ruby is Object
        - Methods and blocks are not Objects
        - Objects are created from classes
        - One benefit of creating objects is that they allow the programmer to think on a new level of abstraction
        - Objects are represented as real-world nouns and can be given methods that describe the behavior the programmer is trying to represent.
        
    ```ruby
    class GoodDog; end

    sparky = GoodDog.new
    ```
    - In the above example, we created an instance of our GoodDog class and stored it in the variable sparky. 
    - We now have an object. We say that sparky is an object or instance of class GoodDog. 
    - This entire workflow of creating a new object or instance from a class is called instantiation, so we can also say that we've instantiated an object called sparky from the class GoodDog.
    - An object is returned by calling the class method `new`
    
2. Use attr_* to create setter and getter methods
    - attr_* is Ruby's system build-in methods to automatically create getter and setter methods for Class Instance. It includes three types: attr_accessor, attr_reader, and attr_writer.
    - The attr_accessor method takes a symbol as an argument, which it uses to create the method name for the getter and setter methods. That one line replaced two method definitions.
        ```ruby
        class GoodDog
        attr_accessor :name

        def initialize(name)
          @name = name
        end

        def speak
          "#{@name} says arf!"
        end
        end

        sparky = GoodDog.new("Sparky")
        puts sparky.speak
        puts sparky.name            # => "Sparky"
        sparky.name = "Spartacus"
        puts sparky.name            # => "Spartacus"
        ```
   ```ruby
    class Cat
      def initialize(name, color)
        @name = name
        @color = color
      end
    
      def name
        @name
      end
    
      def name=(new_name)
        @name = new_name
      end
    end
    
    kitty = Cat.new('kitty', 'white')
    p kitty.name
    kitty.name = 'meow'
    p kitty.name
   ```
    - The above code shows the original getter and setter methods. If use attr_* methods, these original methods will no longer need.
    - By using getter and setter methods to access the instance variables, we make only one interface to access instance variables. If later we need to change the implementation of instance variables, instead of change multiple places of the occurrance, we only need to change in one place.

3. How to call setters and getters
    ```ruby
    kitty = Cat.new('kitty', 'white')
    p kitty.name
    kitty.name = 'meow'
    p kitty.name
    ```
4. Instance methods vs. class methods
    - In Ruby, a method provides functionality to an Object. A class method provides functionality to a class itself, while an instance method provides functionality to one instance of a class.
    - all objects of the same class have the same behaviors, though they contain different states.
    - Class methods
        - are methods we can call directly on the class itself, without having to instantiate any objects.
        - When defining a class method, we prepend the method name with the reserved word `self`
        - When we call the class method, we use the class name GoodDog followed by the method name, without even having to instantiate any objects.
        - Why we need class method, class method is where we put functionality that does not pertain to individual objects.
        - Objects contain state, and if we have a method that does not need to deal with states, we can just use a class method.
5. Referencing and setting instance variables vs. using getters and setters
6. Class inheritance, encapsulation, and polymorphism
    - Inheritance
        - The concept of inheritance is used in Ruby where a class inherits the behaviors of another class, referred to as the superclass. This gives Ruby programmers the power to define basic classes with large reusability and smaller subclasses for more fine-grained, detailed behaviors.
    - Encapsulation
        - is hiding pieces of functionality and making it unavailable to the rest of the code base. It is a form of data protection, so that data cannot be manipulated or changed without obvious intention.
    - Polymorphism
        - is the ability for different types of data to respond to a common interface. For instance, if we have a method that expects argument objects that have an move method, we can pass it any type of argument, provided it has a compatible move method. The object might represent a human, a cat, a jellyfish, or, conceivably, even a car or train. That is, it lets objects of different types respond to the same method invocation.
        - Another way to apply polymorphic structure to Ruby programs is to use a Module.
7. Modules
  - A module allows us to group reusable code into one place.
  - Modules are similar to classes in that they contain shared behavior.
  - You cannot create an object with a module.
  - A module must be mixed in with a class using the `include` method invocation. It is called a mixin.
  - Modules are also used as a namespace.
8. Method lookup path
   
    - Ruby has a distinct lookup path that it follows each time a method is called. We can use the ancestors method on any class to find out the method lookup chain.
    
9. self
    - Calling methods with self
        - To disambiguate from creating a local variable, we need to use self.name= to let Ruby know that we're calling a method.
        - Use self when calling setter methods from within the class. In our earlier example we showed that self was necessary in order for our change_info method to work properly. We had to use self to allow Ruby to disambiguate between initializing a local variable and calling a setter method.
    - More about self
        - `self` can refer to different things depending on where it is used.
            - From within the class, when an instance method uses self, it references the calling object. Inside of an instance method, references the instance (object) that called the method - the calling object. Therefore `self.weight=` is the same as `sparky.weight=`.
            - Outside of an instance method, references the class and can be used to define class methods. Therefore if we were to define a `name` class method, `def self.name=(n)` is the same as `def GoodDog.name=(n)`.
            - When self is prepended to a method definition, it is defining a class method.
            - using self inside a class but outside an instance method refers to the class itself.
            ```ruby
            class GoodDog
              # ... rest of code omitted for brevity
              puts self
            end
            ```
            ```ruby
            irb :001 > GoodDog
            => GoodDog
            ```
            - Therefore, a method definition prefixed with self is the same as defining the method on the class. That is, def self.a_method is equivalent to def GoodDog.a_method. That's why it's a class method; it's actually being defined on the class.
    
10. Reading OO code

11. Fake operators and equality
    
    - In Ruby, some operators are actually methods. They looks like operators because of Ruby's syntactical sugar.
    
12. Truthiness

13. Working with collaborator objects

     - Objects that are stored as state within another object are called 'collaborator objects'
     - A collaborative relationship is a relationship of association — not of inheritance. Collaboration is a *has-a* relationship rather than a *is-a* relationship.
       - **Association** can be thought of as a *has-a* relationship. For example, a library has books, so there is an associative relationship between objects of class Library and objects of class Book.

14. under what circumstances, you will need Modules. Namespace.
     write a code that need module instead of inheritance.
     - One of the downsides of inheritance is that a class can only sub-class from one super class. In some situations, this limitation makes it very difficult to accurately model the problem domain. 
     - https://launchschool.com/lessons/dfff5f6b/assignments/2cf31cc8
     - This is the classical question of how a language should support multiple inheritance, and Ruby's answer is by way of mixing in behaviors. A class can only sub-class from one parent, but it can mix in as many modules as it likes.
     ```ruby
     module Swim
       def swim
         "swimming!"
       end
     end
     
     class Dog
       include Swim
       # ... rest of class omitted
     end
     
     class Fish
       include Swim
       # ... rest of class omitted
     end
     ```

15. Lexical Scoping
    
    - Lexical scoping refers to grouping things together based on where they appear in the code, not on where they belong in an abstract object model.
    
16. Variable Scope
    1. Instance Variable Scope
       1. Scoped at the object level
       2. Do **not** cross over between objects
       3. Is accessible in an object's instance methods, even if it's initialized outside of that instance method or not passed in to the method.
    2. Class Variable Scope
       1. Scoped at the class level
       2. Objects can access class variables by way of instance methods
    3. Constant Variable Scope
       1. Have lexical scope
       2. It's available in class methods or instance methods (which implies it's accessible from objects)
    
17. Constants in Inheritance
    
    1. A constant initialized in a super-class is inherited by the sub-class, and can be accessed by both class and instance methods.
    2. Constants are not evaluated at runtime, so their lexical scope - or, where they are used in the code - is very important.
    3. Constant resolution will look at the lexical scope first, and then look at the inheritance hierarchy.
    
18. Class Instance Variable

     1. Wait for future