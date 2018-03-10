class BaseValidator
  attr_accessor :input_data, :output_data
  def initialize(input_data)
    @input_data = input_data
    @output_data = []
  end

  def validate
    result
  end

  def result
    output_data != [] ? output_data : 'No valid data'
  end

  def output_data
    'No valid data'
  end
end
