class BaseParser

  def initialize(string)
    @str = [*string]
    @keys = []
  end

  def result
    parse
  end

  def parse
    raise TypeError if @str.any? { |s| !s.is_a?(String) }

    @str.each { |str| parse_string(str) }
    @keys
  end

  def parse_string(string)
    raise 'Not implemented'
  end

  def array_shaping(value)
    raise 'Not implemented'
  end

  def key(str, format = nil)
    str.scan(format).first
  end
end
