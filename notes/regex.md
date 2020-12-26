1. Alphanumerics
   
   1. /cat/
   
2. Special Characters
   
   1. $ ^ * + ? . ( ) [ ] { } | \ /
   
3. Concatenation
   
   1. /cat/
   
4. Alternation
   
   1. /(cat|dog|rabbit)/
   
5. Set of Characters
   1. Character class pattern
      1. /[abc]/ -- Such a pattern matches a single occurrence of any of the characters between the brackets.
   
6. Range of Characters
   
   1. /[0-9A-Fa-f]/ -- match hexadecimal digits
   
7. Negated Classes
   
   1. /[^aeiou]/
   
8. Any

   1. /./
   2. use /m when . should match newlines
   3. move outside the square brackets

9. Whitespace

   1. \s

   2. \S

   3. ```ruby
      puts 'matched 1' if 'Four score'.match(/\s/)
      puts 'matched 2' if "Four\tscore".match(/\s/)
      puts 'matched 3' if "Four-score\n".match(/\s/)
      puts 'matched 4' if "Four-score".match(/\s/)
      ```

   4. Outside square brackets, e.g., `/\s/`, it stands for one of the whitespace characters. Inside square brackets, e.g., `/[a-z\s]/`, they represent an alternative to the other members of the class. Here, for instance, it represents any lowercase alphabetic character or any whitespace character.
   
10. Digits and Hex Digits

    1. `\d` - Any decimal digit (0-9)
    2. \D - Any character but a decimal digit
    3. \h - Any hexadecimal digit (0-9, A-F, a-f) **(Ruby)**
    4. \H - Any character but a hexadecimal digit **(Ruby)**

11. Word Characters

    1. `/\w/` - include all alphabetic characters (a-z, A-Z), all decimal digits (0-9), and, oddly, an underscore (`_`). 
    2. `/\W/` matches "non-word characters".

12. Start/End of Line

    1. ^
    2. $

13. Start/End of String

    1. \A - beginning of the string
    2. \z - always matches at the end of a string
    3. \Z - matches up to, but not including, a newline at the end of the string

14. Word Boundaries

    1. \b
    2. \B

15. Quantifiers

    1. `*` - 0 or more 
    2. `+` - 1 or more
    3. `?` - 0 or 1

16. Ranges

    1. `p{m}` matches precisely `m` occurrences of the pattern `p`.
    2. `p{m,}` matches `m` or more occurrences of `p`.
    3. `p{m,n}` matches `m` or more occurrences of `p`, but not more than `n`.

17. Greediness vs. Laziness
