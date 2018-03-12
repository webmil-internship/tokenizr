require 'minitest/autorun'
require_relative '../../classes/provider/github_provider'

class GithubProviderTest < Minitest::Test
  KEY_PHRASE = 'accesskey'.freeze

  def test_results_is_array
    assert_kind_of Array, GithubProvider.new(KEY_PHRASE).results
  end

  def test_results_include_key_phrase
    assert_includes GithubProvider.new(KEY_PHRASE).results.first, KEY_PHRASE
  end
end
