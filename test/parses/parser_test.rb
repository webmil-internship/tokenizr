require 'minitest/autorun'
require_relative '../../classes/parser/base_parser'

class ParserTest < Minitest::Test
  EXAMPLE_STRING = 'secrettId: AKIAJB5GNEGKOUGXZ3KQ '.freeze
  STRING_RESULT = 'AKIAJB5GNEGKOUGXZ3KQ'.freeze
  KEY_ID = /(?<![A-Z0-9])[A-Z0-9]{20}(?![A-Z0-9])/

  def test_result
    parser = BaseParser.new('String')
    assert_raises('Not implemented') { parser.result }
  end

  def test_parse
    parser = BaseParser.new('String')
    assert_raises('Not implemented') { parser.parse }
  end

  def test_parse_string
    parser = BaseParser.new('String')
    assert_raises('Not implemented') { parser.parse_string('String') }
  end

  def test_array_shaping
    parser = BaseParser.new('String')
    assert_raises('Not implemented') { parser.array_shaping('String') }
  end

  def test_key
    parser = BaseParser.new('String')
    assert_equal STRING_RESULT, parser.key(EXAMPLE_STRING, KEY_ID)
  end

  def test_wrong_param_key
    parser = BaseParser.new('String')
    assert_raises(ArgumentError) { parser.key }
  end

  def test_wrong_type_param_exception
    parser = BaseParser.new(1)
    assert_raises(TypeError) { parser.result }
  end

  def test_wrong_param_exception
    assert_raises(ArgumentError) { BaseParser.new('string1', 'string2') }
  end
end
