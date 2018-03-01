class Parser
  def initialize(string)
    @str = string
    @keys = []
  end

  def result
    parse
    @keys
  end

  private

  def parse
    if @str.kind_of?(Array)
      parse_array
    elsif @str.kind_of?(String)
      parse_string
    else
      raise TypeError
    end
  end

  def parse_string(string=nil)
    value = {}
    string_for_parse = string || @str
    value[:access_key_id] = key(string_for_parse, /(?<![A-Z0-9])[A-Z0-9]{20}(?![A-Z0-9])/)
    value[:access_secret_key] = key(string_for_parse,
                                /(?<![A-Za-z0-9\/+=])[A-Za-z0-9\/+=]{40}(?![A-Za-z0-9\/+=])/)
    array_shaping(value)
  end

  def parse_array
    @str.each { |str| parse_string(str) }
  end

  def key(str, format)
    str.scan(format).first
  end

  def array_shaping(value)
    unless value[:access_key_id].nil? || value[:access_secret_key].nil?
      @keys << value
    end
  end
end
