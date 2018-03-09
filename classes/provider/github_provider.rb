class GithubProvider
  require 'dotenv/load'
  require 'octokit'
  require 'awesome_print'
  require 'net/http'
  require 'uri'

  attr_accessor :results, :key

  def initialize(key)
    # @token = ENV['TOKEN']
    @token = CONFIG['github_token']
    @result = []
    @key = key
  end

  def results
    client = Octokit::Client.new access_token: @token
    res = client.search_code(@key, page: 100, per_page: 10,
                             headers: { "Accept" => "application/vnd.github.v3.text-match+json" })
    @result = res.items.map{|item| item.text_matches.map(&:fragment) }.flatten
  end
end