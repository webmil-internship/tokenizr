# Just a top_level_class_documentation comment :)
class BaseValidator
  attr_accessor :region, :target, :output_data, :input_data
  def initialize(input_data)
    @input_data = input_data
    @target = target
    @region = 'us-west-2'
    @output_data = []
  end

  def validate
    result
  end

  private

  def result
    @input_data.each do |hash|
      access_key = hash[:access_key]
      secret_key = hash[:secret_key]
      valid_hash = { access_key_id: access_key, secret_access_key: secret_key }
      hash_data = validate_keys(access_key, secret_key)
      output_data << valid_hash if hash_data != false
    end
    output_data
  rescue TypeError
    'Array must contain hashes'
  end

  def validate_keys(access_key, secret_key)
    ec2 = Aws::EC2::Client.new(
      region: region, access_key_id: access_key, secret_access_key: secret_key
    )
    ec2.describe_regions
  rescue Aws::EC2::Errors::AuthFailure
    false
  end
end