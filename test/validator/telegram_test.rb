require 'yaml'
require 'telegram/bot'
require_relative '../test_helper'
require './classes/validator/telegram_validator'

class TelegramTest < Minitest::Test
  CONFIG = YAML.load_file('./conf/config.yml') unless defined? CONFIG
  def setup
    @valid_token = CONFIG['telegram_api_token']
    @second_valid_token = CONFIG['second_telegram_api_token']
    @wrong_token = CONFIG['wrong_telegram_api_token']
    @input_data = [
      { token: @valid_token },
      { token: @wrong_token },
      { token: @second_valid_token }
    ]
    @validator = TelegramValidator.new(@input_data)
  end

  def test_it_exists
    assert_kind_of TelegramValidator, @validator
  end

  def test_it_receives_message_with_empty_array
    empty_data = []
    empty_validator = TelegramValidator.new(empty_data)
    assert_equal('Array must contain hashes', empty_validator.validate)
  end

  def test_it_returns_true_with_valid_keys
    assert_equal(true, @validator.validate_token(@valid_token))
  end

  def test_it_returns_false_with_invalid_keys
    assert_equal(false, @validator.validate_token(@wrong_token))
  end

  def test_it_returns_array_of_valid_hashes
    assert_equal([
                   { token: @valid_token }, { token: @second_valid_token }
                 ], @validator.validate)
  end
end
