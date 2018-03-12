# Tokenizer
# Parser
# How to using parser:

- require necessary file from classes/parser/ to your class
- initialize necessary class with string or array
- use method result from class

# How to create your parser

- Create file
- Add inheritance with class Parser
- Implement methods parse_string(string)
    - Inside parse_string(string) initialize hash
    - Push to hash data from method key(string, format), where string - where we search data, and format - what  we search (reqex format)
    - Finally use method array_shaping(hash) to create array of hashes with search data
    - EXAMPLE: see amazon_parser.rb in classes/parser folder
