class BaseProvider
  attr_accessor :key_phrase

  def initialize(key_phrase)
    @array = []
    @key_phrase = key_phrase
  end

  def results
    raise 'Key_phrase has invalid format.' unless is_key_phrase_valid?(key_phrase)
    search_word
    save_array
  end
  
  private

  def is_key_phrase_valid?(key_phrase)
    key_phrase.is_a?(String)
  end
end

