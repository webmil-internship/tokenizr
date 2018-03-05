# Main class
class CracksMan
  attr_accessor :provider, :target, :key_phrase

  def initialize(provider, target, key_phrase)
    @provider = provider
    @target = target
    @key_phrase = key_phrase
    @client = Octokit::Client.new(access_token: CONFIG['github_token'])
  end

  def handling
    puts '<================ start searching ================>'
    search_result = Provider.new(@key_phrase).results
    puts '<================ search result ================>'
    puts search_result
    puts '<================ start parsing ================>'
    parsed_phrases = Parser::Amazon.new(search_result).result
    puts '<================ parse result ================>'
    puts parsed_phrases
#    valid_phrases = check_valid_phrases(phrases)
#    save_valid_phrases(valid_phrases)
  end

  private

  def save_valid_phrases(valid_phrases)
    @passkey = Passkey.create(provider: @provider,
                              target: @target,
                              key_phrase: @key_phrase,
                              when: Time.now)
    valid_phrases.each do |row|
      @passkey.add_phrase(val_phrase: row)
    end
  end
end
