# Just a top_level_class_documentation comment :)
class Validator
  attr_accessor :access_key, :secret_key, :region, :service, :output
  CONFIG = YAML.load_file('./conf/config.yml') unless defined? CONFIG
  def initialize(input_data, service)
    @input_data = input_data
    @service = service
    @region = CONFIG['aws_region']
    @output = []
  end

  def validate
    validate_amazon if service == 'amazon'
    # TODO: Add methods for other validations
  end

  private

  def validate_amazon
    @input_data.each do |hash|
      hash_data = valid_amazon_data(hash[:access_key], hash[:secret_key])
      output << hash_data if hash_data != false
    end
    output
  end

  def valid_amazon_data(access_key, secret_key)
    ec2 = Aws::EC2::Client.new(
      region: region, access_key_id: access_key, secret_access_key: secret_key
    )
    ec2.describe_regions
    { service: service,
      access_key_id: access_key,
      secret_access_key: secret_key }
    rescue # TODO: Investigate what type of error returs Amazon
      false
    # TODO: Add resque for Network errors
  end
end
