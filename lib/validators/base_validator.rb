module Validators
  class BaseValidator
    attr_accessor :input_data
    def initialize(input_data)
      @input_data = input_data
      @output_data = []
    end

    def validate
      output_data.nil? ? [] : output_data
    end

    def output_data; end

    def parsed_array; end

    def validate_input; end
  end
end
