require_relative 'base_validator'
require 'telegram/bot'

module Validators
  class TelegramValidator < BaseValidator
    attr_accessor :output_hash
    def initialize(input_data)
      @input_data = input_data
      @output_hash = []
    end

    def output_data
      @input_data.each(&parsed_array)
      output_hash == [] ? [] : output_hash.uniq
    end

    private

    def parsed_array
      proc do |hash|
        token = hash[:token]
        valid_hash = { token: token }
        hash_data = validate_input(token)
        output_hash << valid_hash if hash_data != false
      end
    end

    def validate_input(token)
      tgconnect = Telegram::Bot::Client.run(token,
                                            logger: Logger.new($stderr)) do |bot|
        bot.api.getMe
      end
      tgconnect.value?(true)
    rescue Telegram::Bot::Exceptions::ResponseError
      false
    end
  end
end
