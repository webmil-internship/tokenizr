require_relative "classes/parser"

string = ['{ secretAccessKey= SmwCRSb6fNwu92GmsdZPPwcdA/6D0vl3hl6xerFT secrettId: AKIAJB5GNEGKOUGXZ3KQ }',
            'тут нічого немає',
            '2',
            'а тут ще один ключ SmwCRSb6fNwu92GmsdZPPwcdA/6D0vl3hl6xerFT',
            '{ secretAccessKey= jIWoG3hN7DcEpREpiH51y7DdVNu8N8Ge2XNxfB5r secrettId: AKIAIOSFODNN7EXAMPLE }']
parser = Parser::Github.new(string)
p parser.result
