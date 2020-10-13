<details>
  <summary>something</summary>
  ddd
</details>

1. Find the nouns
   1. If also can find this noun’s behaviour, then can consider to create this noun’s class
2. Determine if a Class has a single responsibility (highly cohesive)
   1. Rephrase every one of its methods as a question, asking the question ought to make sense. If we have Gear Class, methods as “ratio”, “gear_inches”, “tire", we can ask below questions:
      1. Please Mr. Gear, what is your ratio?
         1. seems perfectly
      2. Please Mr. Gear, what are your gear_inches
         1. on shaky ground
      3. Please Mr. Gear, what is your tire(size)
         1. downright ridiculous
   2. Describe the Class in one sentence
      1. If you need to use ‘and’ to describe, the class likely has more than one responsibility.
      2. If you use the word ‘or’, then the class has more than one responsibility, and they aren’t even very related.