require 'dotenv/load'
require 'octokit'
require_relative 'base_provider'

module Providers
  class GithubProvider < BaseProvider
    attr_accessor :res

    def initialize(key_phrase)
      @token = ENV['GITHUB_TOKEN']
      @key_phrase = key_phrase
      @res = res
      @array = []
    end

    private

    def search_word
      (1..10).each do |i|
        client = Octokit::Client.new access_token: @token
        @res = client.search_code(@key_phrase, page: i, per_page: 100,
                                  headers: {"Accept" => "application/vnd.github.v3.text-match+json"})
        @array << @res.items.map { |item| item.text_matches.map(&:fragment) }.flatten
      end
    end

    def save_array
      @array.flatten
    end
  end
end
