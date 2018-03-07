require_relative 'base_parser'

class TelegramParser < BaseParser
  TOKEN = /(?<![A-Z0-9])[A-Z0-9]{20}(?![A-Z0-9])/

  def parse_string(string)
    value = {
      token: key(string, TOKEN),
    }
    array_shaping(value)
  end
end
