class BaseParser

  def initialize
    @keys = []
  end

  def result(data)
    parse([*data])
  end

  def parse(data)
    raise TypeError if data.any? { |s| !s.is_a?(String) }

    data.each { |str| parse_string(str) }
    @keys
  end

  def parse_string(string)
    raise 'Not implemented'
  end

  def array_shaping(key_pair)
    @keys << key_pair unless key_pair.values.any? { |e| e.nil? }
  end

  def key(str, format = nil)
    str.scan(format).first
  end
end
