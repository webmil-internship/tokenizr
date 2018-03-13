# Main class
class CracksMan
  attr_accessor :provider, :target, :key_phrase

  def initialize(provider, target, key_phrase)
    @provider = provider
    @target = target
    @key_phrase = key_phrase
  end

  def handling
    search_result =
      Object.const_get("#{@provider}Provider").new(@key_phrase).results
    puts "==================================== search_result =========================================="
    puts search_result
    parsed_phrases =
      Object.const_get("#{@target}Parser").new.result(search_result)
    puts "==================================== parsed_phrases ==========================================="
    puts parsed_phrases
    valid_phrases =
      Object.const_get("#{@target}Validator").new(parsed_phrases).validate
    puts "==================================== valid_phrases ==========================================="
    puts valid_phrases

    save_valid_phrases(valid_phrases)
  end

  private

  def save_valid_phrases(valid_phrases)
    @passkey = Passkey.create(provider: @provider,
                              target: @target,
                              key_phrase: @key_phrase,
                              when: Time.now)
    valid_phrases.each do |pairs|
      pairs.each { |k, v| @passkey.add_phrase(phrase_key: k, phrase_val: v) }
    end
  end
end
