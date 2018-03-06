# Just a top_level_class_documentation comment :)
class Validator
  attr_accessor :access_key, :secret_key, :region, :target, :output, :input_data
  def initialize(input_data, target)
    @input_data = input_data
    @target = target
    @region = 'us-west-2'
    @output = []
  end

  def validate
    if target == 'amazon'
      validate_amazon
    else
      'Unsupported target given'
      # TODO: Add methods for other validations
    end
  end

  private

  def validate_amazon
    @input_data.each do |hash|
      hash_data = valid_amazon_data(hash[:access_key], hash[:secret_key])
      output << hash_data if hash_data != false
    end
    output
  rescue TypeError
    'Array must contain hash with Access Key ID and Secret access key'
  end

  def valid_amazon_data(access_key, secret_key)
    ec2 = Aws::EC2::Client.new(
      region: region, access_key_id: access_key, secret_access_key: secret_key
    )
    ec2.describe_regions
    { access_key_id: access_key,
      secret_access_key: secret_key }
  rescue Aws::EC2::Errors::AuthFailure
    false
  end
end
