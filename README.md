=======
# Tokenizr
## Some short description of service

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

### Usage of the module Validator.

1. Require nessesary file from _classes/validator_ folder
2. Initialize required `Validator` Class with an array of data which are need
to validate.
3. Use method `validate` from initialized class

### Making Your own child class

1. Create file in _Validator_ folder.
..- Use the naming template _TargetValidator.rb_.
2. Inherit methods from `Validator` class
3. Implement method `output_data` to return an array of hashes with validated
data.

### Readme for tokenizr class Provider:

1. git clone https://github.com/webmil-internship/tokenizr.git
2. git checkout alpha
3. bundle install
4. unzip config.yml.zip
5. unzip db/sbs.db.zip (existing DB) OR rake db:migrate (empty DB)
6. ruby app_con.rb (console version) OR rerun app_web.rb (web version)
7. For web version edit config.yml and set valid ip_address and ip_port (e.g. ip_address: '192.168.1.63', ip_port: '4567')
