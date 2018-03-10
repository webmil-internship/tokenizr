# Tokenizr
## Some short description of service

### Usage of the module Validator.

1. Require nessesary file from classes/validator folder
2. Initialize required `Validator` Class with an array of data which are need
to validate.
3. Use method `validate` from initialized class

### Making Your own child class

1. Create file in ~Validator~ folder.
- Use the naming template TargetValidator.rb.
2. Inherit methods from `Validator` class
3. Implement method `output_data` to return an array of hashes with validated
data.
