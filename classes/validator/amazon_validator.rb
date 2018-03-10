require_relative 'base_validator'

class AmazonValidator < BaseValidator
  attr_accessor :region, :output_hash
  def initialize(input_data)
    @input_data = input_data
    @region = 'us-west-2'
    @output_hash = []
  end

  def output_data
    @input_data.each(&parsed_array)
    output_hash.uniq
  rescue TypeError
    'Array must contain hashes'
  end

  private

  def parsed_array
    proc do |hash|
      access_key = hash[:access_key]
      secret_key = hash[:secret_key]
      valid_hash = { access_key_id: access_key,
                     secret_access_key: secret_key }
      hash_data = validate_keys(access_key, secret_key)
      output_hash << valid_hash if hash_data != false
    end
  end

  def validate_keys(access_key, secret_key)
    ec2 = Aws::EC2::Client.new(
      region: region, access_key_id: access_key, secret_access_key: secret_key
    )
    ec2.describe_regions
    true
  rescue Aws::EC2::Errors::AuthFailure
    false
  end
end
