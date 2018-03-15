require_relative 'base_parser'

module Parsers
  class TelegramParser < BaseParser
    TOKEN = /\d{5,10}:[A-Za-z0-9\/+=-]{30,40}/

    def parse_string(string)
      value = {
        token: key(string, TOKEN)
      }
      array_shaping(value)
    end
  end
end
