require 'minitest/autorun'
require_relative '../../lib/providers/gitlab_provider'

class GitlabProviderTest < Minitest::Test
  KEY_PHRASE = 'AccessKey'.freeze

  def test_results_is_array
    assert_kind_of Array, Providers::GitlabProvider.new(KEY_PHRASE).results
  end

  def test_results_include_key_phrase
    assert_includes Providers::GitlabProvider.new(KEY_PHRASE).results.first, KEY_PHRASE
  end
end
