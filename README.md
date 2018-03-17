=======
# Tokenizr Howto

1. `git clone https://github.com/webmil-internship/tokenizr.git`
2. `bundle install` and `rake db:migrate`
3. `ruby app_con.rb` (console version) OR rerun `app_web.rb` (web version)
4. For web version edit `config.yml` and set valid ip_address and ip_port (e.g. ip_address: '192.168.1.63', ip_port: '4567')

## How to use Parser

1. require necessary file from _lib/parsers/_ to your class
2. initialize necessary class with string or array
3. use method result from class

## How to create your own Parser

1. Create file in _lib/parsers/_ folder
2. Add inheritance with class Parser
3. Implement methods `parse_string(string)`
    - Inside `parse_string(string)` initialize hash
    - Push to hash data from method key(string, format), where `string` - it is where we search data, and `format` - it is what we search (reqex format)
    - Finally use method `array_shaping(hash)` to create array of hashes with search data
    - EXAMPLE: see `amazon_parser.rb` in _lib/parser folder_

## How to use Validator

1. Require nessesary file from _lib/validators_ folder.
2. Initialize required `Validator`_lib/parsers/_  Class with an array of data which are need
to validate.
3. Use method `validate` from initialized class.

## How to make your own Validator

1. Create file in _Validators_ folder.
..- Use the naming template _TargetValidator.rb_.
2. Inherit methods from `Validator` class
3. Implement method `output_data` to return an array of hashes with validated
data.

## How to use Provider

1. Require necessary file from _lib/providers/_ to your class.
2. Initialize necessary class with string of key_phrase.
3. Use method `results` from class.

## How to create your own Provider

1. Create file in _lib/providers/_ folder.
2. Add inheritance with class Provider.
3. Implement method `search_word` to get a fragment which include key_phrase. Then implement 
method `save_array`to return an array of all fragments.

