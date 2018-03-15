require 'dotenv/load'
require 'gitlab'
require_relative 'base_provider'

module Providers
  class GitlabProvider < BaseProvider
    attr_accessor :projects

    def initialize(key_phrase)
      @projects = projects
      @key_phrase = key_phrase
    end

    Gitlab.configure do |config|
      config.endpoint       = ENV['GITLAB_API_ENDPOINT']
      config.private_token  = ENV['GITLAB_TOKEN']
    end

    private

    def search_word
      @projects = Gitlab.project_search(@key_phrase)
    end

    def save_array
      @array = @projects.map(&:description)
    end
  end
end
