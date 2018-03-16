require 'yaml'
require_relative '../test_helper'
require './lib/validators/base_validator'
class ValidatorTest < MiniTest::Test
  CONFIG = YAML.load_file('./conf/config.yml') unless defined? CONFIG
  def setup
    @target = CONFIG['target']
    @aws_region = CONFIG['aws_region']
    @input_data = [
      { access_key: CONFIG['aws_access_key_id'],
        secret_key: CONFIG['aws_secret_access_key'] },
      { access_key: CONFIG['wrong_aws_access_key_id'],
        secret_key: CONFIG['wrong_aws_secret_access_key'] },
      { access_key: CONFIG['second_aws_access_key_id'],
        secret_key: CONFIG['second_aws_secret_access_key'] }
    ]
    @validator = Validators::BaseValidator.new(@input_data)
  end

  def test_it_exists
    assert_kind_of Validators::BaseValidator, @validator
  end

  def test_it_receives_message_with_empty_array
    empty_data = []
    empty_validator = Validators::BaseValidator.new(empty_data)
    assert_equal([], empty_validator.validate)
  end

  def test_it_receives_message_with_any_data
    any_data = 'anydata'
    empty_validator = Validators::BaseValidator.new(any_data)
    assert_equal([], empty_validator.validate)
  end
end
