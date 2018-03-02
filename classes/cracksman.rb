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
    result = search_result
    fragments = extract_fragments(result)
    dirty_phrases = extract_phrases(fragments)
    parsed_phrases = parse_phrases(dirty_phrases)
    valid_phrases = check_valid_phrases(phrases)
    save_valid_phrases(valid_phrases)
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
