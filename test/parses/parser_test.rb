require "minitest/autorun"
require_relative '../classes/parser'

class ParserTest < Minitest::Test
  EXAMPLE_ARRAY =
    ['{ secretAccessKey= SmwCRSb6fNwu92GmsdZPPwcdA/6D0vl3hl6xerFT secrettId: AKIAJB5GNEGKOUGXZ3KQ }',
     'тут нічого немає',
     'і тут нічого немає',
     'а тут ще один ключ SmwCRSb6fNwu92GmsdZPPwcdA/6D0vl3hl6xerFT',
     '{ secretAccessKey= jIWoG3hN7DcEpREpiH51y7DdVNu8N8Ge2XNxfB5r secrettId: AKIAIOSFODNN7EXAMPLE }']
  def test_array
    array_for_parse = example_array
    parser = Parser.new(array_for_parse)
    actual_result = actual_result_from_array
    assert_equal actual_result, parser.result
  end

  def test_string
    string_for_parse = '{ secretAccessKey= SmwCRSb6fNwu92GmsdZPPwcdA/6D0vl3hl6xerFT secrettId: AKIAJB5GNEGKOUGXZ3KQ }'
    parser = Parser.new(string_for_parse)
    actual_result = [{ access_key_id: 'AKIAJB5GNEGKOUGXZ3KQ',
                       access_secret_key: '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' }]
    assert_equal actual_result, parser.result
  end

  def test_wrong_type_param_exception
    parser = Parser.new(1)
    assert_raises(TypeError) { parser.result }
  end

  def test_wrong_param_exception
    assert_raises(ArgumentError) { Parser.new('string1', 'string2') }
  end

  private

  def example_array
    ['{ secretAccessKey= SmwCRSb6fNwu92GmsdZPPwcdA/6D0vl3hl6xerFT secrettId: AKIAJB5GNEGKOUGXZ3KQ }',
     'тут нічого немає',
     'і тут нічого немає',
     'а тут ще один ключ SmwCRSb6fNwu92GmsdZPPwcdA/6D0vl3hl6xerFT',
     '{ secretAccessKey= jIWoG3hN7DcEpREpiH51y7DdVNu8N8Ge2XNxfB5r secrettId: AKIAIOSFODNN7EXAMPLE }']
  end

  def actual_result_from_array
    [{ access_key_id: 'AKIAJB5GNEGKOUGXZ3KQ',
       access_secret_key: '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' },
     { access_key_id: 'AKIAIOSFODNN7EXAMPLE',
     access_secret_key: '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' }]
  end
end
