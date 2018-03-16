require 'minitest/autorun'
require_relative '../../lib/providers/base_provider'

class ProviderTest < Minitest::Test
  KEY_PHRASE = 'AccessKey'.freeze

  def test_key_phrase_valid_format
    assert_raises('Key_phrase has invalid format.') { Providers::BaseProvider.new(1).results }
  end

  def test_wrong_number_arg_exception
    assert_raises(ArgumentError) { Providers::BaseProvider.new }
  end
end

