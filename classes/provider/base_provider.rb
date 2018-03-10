class BaseProvider
  attr_accessor :key_phrase

  def initialize(key_phrase)
    @array = []
    @key_phrase = key_phrase
  end

  def results
    search_word
    save_array
  end
end