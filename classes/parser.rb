class Parser
  class Amazon
    SEARCH_WORD = 'secretAccessKey'.freeze

    def self.word
      SEARCH_WORD
    end
  end

  class Github
    KEY_ID = /(?<![A-Z0-9])[A-Z0-9]{20}(?![A-Z0-9])/
    SECRET_KEY = %r{(?<![A-Za-z0-9\/+=])[A-Za-z0-9\/+=]{40}(?![A-Za-z0-9\/+=])}
    def initialize(string)
      @str = [*string]
      @keys = []
    end

    def result
      parse
      @keys
    end

    private

    def parse
      raise TypeError if @str.any? { |s| !s.is_a?(String) }

      @str.each { |str| parse_string(str) }
    end

    def parse_string(string)
      value = {}
      value[:access_key_id] = key(string, KEY_ID)
      value[:access_secret_key] = key(string, SECRET_KEY)
      array_shaping(value)
    end

    def array_shaping(value)
      @keys << value unless value[:access_key_id].nil? ||
                            value[:access_secret_key].nil?
    end

    def key(str, format = nil)
      str.scan(format).first
    end
  end
end
