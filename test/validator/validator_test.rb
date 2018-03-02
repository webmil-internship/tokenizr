require 'yaml'
require_relative '../test_helper'
require './classes/validator'
require 'aws-sdk-ec2'
# top_level_class_documentation comment :)
class ValidatorTest < MiniTest::Test
  CONFIG = YAML.load_file('./conf/config.yml') unless defined? CONFIG
  def setup
    @validator = Validator.new
    @service = CONFIG['service']
    @aws_region = CONFIG['aws_region']
    @input_data = [
      { access_key: CONFIG['aws_access_key_id'],
        secret_key: CONFIG['aws_secret_access_key'] },
      { access_key: CONFIG['wrong_aws_access_key_id'],
        secret_key: CONFIG['wrong_aws_secret_access_key'] },
      { access_key: CONFIG['second_aws_access_key_id'],
        secret_key: CONFIG['second_aws_secret_access_key'] }  
    ]
  end

  def test_it_exists
    assert_kind_of Validator, @validator
  end

  def test_it_returns_hash_with_correct_keys
    access_key = CONFIG['aws_access_key_id']
    secret_key = CONFIG['aws_secret_access_key']
    second_access_key = CONFIG['second_aws_access_key_id']
    second_secret_key = CONFIG['second_aws_secret_access_key']
    assert_equal([
                    { service: @service, access_key_id: access_key,
                      secret_access_key: secret_key },
                    { service: @service, access_key_id: second_access_key,
                   secret_access_key: second_secret_key }
                  ],
                 @validator.validate
  end

  def test_it_returns_false_with_wrong_keys
    access_key = CONFIG['wrong_aws_access_key_id']
    secret_key = CONFIG['wrong_aws_secret_access_key']
    assert_equal(false, @validator.valid_data(access_key, secret_key))
  end
end
