require_relative 'base_parser'

module Parsers
  class AmazonParser < BaseParser
    KEY_ID = /(?<![A-Z0-9])[A-Z0-9]{20}(?![A-Z0-9])/
    SECRET_KEY = %r{(?<![A-Za-z0-9\/+=])[A-Za-z0-9\/+=]{40}(?![A-Za-z0-9\/+=])}

    def parse_string(string)
      value = {
        access_key_id: key(string, KEY_ID),
        access_secret_key: key(string, SECRET_KEY)
      }
      array_shaping(value)
    end
  end
end
