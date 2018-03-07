require 'minitest/autorun'
require_relative '../../classes/parser/amazon_parser'

class AmazonParserTest < Minitest::Test
  EXAMPLE_ARRAY =
    ['{ secretAccessKey= SmwCRSb6fNwu92GmsdZPPwcdA/6D0vl3hl6xerFT '\
     'secrettId: AKIAJB5GNEGKOUGXZ3KQ }',
     'тут нічого немає',
     'і тут нічого немає',
     'а тут ще один ключ SmwCRSb6fNwu92GmsdZPPwcdA/6D0vl3hl6xerFT',
     '{ secretAccessKey= jIWoG3hN7DcEpREpiH51y7DdVNu8N8Ge2XNxfB5r '\
     'secrettId: AKIAIOSFODNN7EXAMPLE }'].freeze
  EXAMPLE_STRING = '{secretAccessKey SmwCRSb6fNwu92GmsdZPPwcdA/6D0vl3hl6xerFT '\
                   'secrettId: AKIAJB5GNEGKOUGXZ3KQ }'.freeze
  RESULT_FROM_STRING = [{ access_key_id: 'AKIAJB5GNEGKOUGXZ3KQ',
                          access_secret_key: 'SmwCRSb6fNwu92GmsdZPPwcdA/6'\
                                             'D0vl3hl6xerFT' }].freeze
  RESULT_FROM_ARRAY = [{ access_key_id: 'AKIAJB5GNEGKOUGXZ3KQ',
                         access_secret_key: 'SmwCRSb6fNwu92GmsdZPPwcdA/6'\
                                            'D0vl3hl6xerFT' },
                       { access_key_id: 'AKIAIOSFODNN7EXAMPLE',
                         access_secret_key: 'jIWoG3hN7DcEpREpiH51y7D'\
                                            'dVNu8N8Ge2XNxfB5r' }].freeze

  def test_array
    array_for_parse = EXAMPLE_ARRAY
    parser = AmazonParser.new(array_for_parse)
    actual_result = RESULT_FROM_ARRAY
    assert_equal actual_result, parser.result
  end

  def test_string
    parser = AmazonParser.new(EXAMPLE_STRING).result
    assert_equal RESULT_FROM_STRING, parser
  end
end