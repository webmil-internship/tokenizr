require 'minitest/autorun'
require_relative '../../classes/parser/base_parser'

class ParserTest < Minitest::Test
  EXAMPLE_STRING = 'secrettId: AKIAJB5GNEGKOUGXZ3KQ '.freeze
  STRING_RESULT = 'AKIAJB5GNEGKOUGXZ3KQ'.freeze
  KEY_ID = /(?<![A-Z0-9])[A-Z0-9]{20}(?![A-Z0-9])/
  WRONG_HASH = { a: nil, b: 'some values' }.freeze
  GOOD_HASH = { a: 'some value', b: 'some values' }.freeze

  def test_result
    parser = BaseParser.new
    assert_raises('Not implemented') { parser.result('String') }
  end

  def test_parse
    parser = BaseParser.new
    assert_raises('Not implemented') { parser.parse('String') }
  end

  def test_parse_string
    parser = BaseParser.new
    assert_raises('Not implemented') { parser.parse_string('String') }
  end

  def test_array_shaping_with_wrong_hash
    parser = BaseParser.new
    assert_nil parser.array_shaping(WRONG_HASH)
  end

  def test_array_shaping_with_good_hash
    parser = BaseParser.new
    assert_equal [GOOD_HASH], parser.array_shaping(GOOD_HASH)
  end

  def test_key
    parser = BaseParser.new
    assert_equal STRING_RESULT, parser.key(EXAMPLE_STRING, KEY_ID)
  end

  def test_wrong_param_key
    parser = BaseParser.new
    assert_raises(ArgumentError) { parser.key }
  end

  def test_wrong_type_param_exception
    parser = BaseParser.new
    assert_raises(TypeError) { parser.result(1) }
  end

  def test_wrong_param_exception
    assert_raises(ArgumentError) { BaseParser.new('string1', 'string2') }
  end
end
