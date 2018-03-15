module Providers
  class BaseProvider
    attr_accessor :key_phrase

    def initialize(key_phrase)
      @array = []
      @key_phrase = key_phrase
    end

    def results
      raise 'Key_phrase has invalid format.' unless key_phrase.is_a?(String)
      search_word
      save_array
    end

    def search_word

    end

    def save_array

    end
  end
end

