require 'yaml'
require_relative '../test_helper'
require './classes/validator/amazon_validator'
require 'aws-sdk-ec2'
class AmazonTest < MiniTest::Test
  CONFIG = YAML.load_file('./conf/config.yml') unless defined? CONFIG
  def setup
    @input_data = [
      { access_key: CONFIG['aws_access_key_id'],
        secret_key: CONFIG['aws_secret_access_key'] },
      { access_key: CONFIG['wrong_aws_access_key_id'],
        secret_key: CONFIG['wrong_aws_secret_access_key'] },
      { access_key: CONFIG['second_aws_access_key_id'],
        secret_key: CONFIG['second_aws_secret_access_key'] }
    ]
    @validator = AmazonValidator.new(@input_data)
  end

  def test_it_exists
    assert_kind_of AmazonValidator, @validator
  end

  def test_it_returns_hash_with_correct_keys
    access_key = CONFIG['aws_access_key_id']
    secret_key = CONFIG['aws_secret_access_key']
    second_access_key = CONFIG['second_aws_access_key_id']
    second_secret_key = CONFIG['second_aws_secret_access_key']
    assert_equal([
                   { access_key_id: access_key,
                     secret_access_key: secret_key },
                   { access_key_id: second_access_key,
                     secret_access_key: second_secret_key }
                 ], @validator.validate)
  end

  def test_it_returns_error_with_wrong_keys
    @wrong_input_data = %w[string1 string2]
    @validator = AmazonValidator.new(@wrong_input_data)
    assert_equal(
      'Array must contain hashes',
      @validator.validate
    )
  end

  def test_it_receives_message_with_empty_array
    empty_data = []
    empty_validator = AmazonValidator.new(empty_data)
    assert_equal('No valid data', empty_validator.validate)
  end
end
