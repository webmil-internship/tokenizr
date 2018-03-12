Readme for tokenizr:

PARSER:

USING:

1. require necessary file from classes/parser/ to your class
2. initialize necessary class with string\array
3. use method result from class

Inheritance:

1. Create file
2. Add inheritance with class Parser
3. Implement methods parse_string(string)
  3.1 Inside parse_string(string) initialize hash
  3.2 Push to hash data from method key(string, format), where string - where we search data, and format - what  we search (reqex format)
  3.3 Finally use method array_shaping(hash) to create array of hashes with search data
