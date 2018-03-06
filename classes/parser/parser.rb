class Parser
  SEARCH_WORD = 'secretAccessKey'.freeze
  KEY_ID = /(?<![A-Z0-9])[A-Z0-9]{20}(?![A-Z0-9])/
  SECRET_KEY = %r{(?<![A-Za-z0-9\/+=])[A-Za-z0-9\/+=]{40}(?![A-Za-z0-9\/+=])}

  def initialize(string)
    @str = [*string]
    @keys = []
  end

  def self.word
    SEARCH_WORD
  end

  def result
    parse
  end

  protected

  def parse
    raise TypeError if @str.any? { |s| !s.is_a?(String) }

    @str.each { |str| parse_string(str) }
    @keys
  end

  def parse_string(string)
    raise "Not implemented"
  end

  def array_shaping(value)
    raise "Not implemented"
  end

  def key(str, format = nil)
    str.scan(format).first
  end
end
