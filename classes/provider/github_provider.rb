require_relative 'base_provider'

class GithubProvider < BaseProvider
  require 'dotenv/load'
  require 'octokit'

  attr_accessor :res

  def initialize(key_phrase)
    @token = ENV['GITHUB_TOKEN']
    @key_phrase = key_phrase
    @res = res
  end

  private

  def search_word
    client = Octokit::Client.new access_token: @token
    @res = client.search_code(@key_phrase, page: 100, per_page: 1,
                              headers: {"Accept" => "application/vnd.github.v3.text-match+json"})
  end

  def save_array
    @array = @res.items.map { |item| item.text_matches.map(&:fragment) }.flatten
  end
end