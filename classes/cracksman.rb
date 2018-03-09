# Main class
class CracksMan
  attr_accessor :provider, :target, :key_phrase

  def initialize(provider, target, key_phrase)
    @provider = provider
    @target = target
    @key_phrase = key_phrase
  end

  def handling
    puts '<================ start searching ================>'
    search_result = Object.const_get("#{@provider}Provider").new(@key_phrase).results
    puts '<================ search result ================>'
    puts search_result
    puts '<================ start parsing ================>'
    # parsed_phrases = Object.const_get("#{@target}Parser").new(search_result).result
    puts '<================ parse result ================>'
    # puts parsed_phrases
    puts '<================ start validating ================>'
    # valid_phrases = Object.const_get("#{@target}Validator").new(parsed_phrases).result
    valid_phrases = [{ access_key_id: "AAAAAAAAAAAAAAAAAAAA", secret_access_key: "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee" },
                     { access_key_id: "QQQQQQQQQQQQQQQQqQQQ", secret_access_key: "inqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq" }]
    puts '<================ validate result ================>'
    puts valid_phrases
    puts '<================ start saving ================>'
    save_valid_phrases(valid_phrases)
    puts '<================ finished ================>'
  end

  private

  def save_valid_phrases(valid_phrases)
    @passkey = Passkey.create(provider: @provider,
                              target: @target,
                              key_phrase: @key_phrase,
                              when: Time.now)
    valid_phrases.each { |pairs| pairs.each { |key, value| @passkey.add_phrase(phrase_key: key, phrase_val: value) } }
  end
end
