class TelegramParser < Parser
  SEARCH_WORD = 'telegram'.freeze
  TOKEN = /(?<![A-Z0-9])[A-Z0-9]{20}(?![A-Z0-9])/

  def parse_string(string)
    value = {
      token: key(string, TOKEN),
    }
    array_shaping(value)
  end

  def array_shaping(value)
    @keys << value unless value[:token].nil?
  end
end
