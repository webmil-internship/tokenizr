class BaseValidator
  attr_accessor :input_data
  def initialize(input_data)
    @input_data = input_data
    @output_data = []
  end

  def validate
    output_data.nil? ? 'No valid data' : output_data
  end

  def output_data
    parsed_array == [] ? 'No valid data' : parsed_array
  end

  def parsed_array
    'No valid data'
  end
end
