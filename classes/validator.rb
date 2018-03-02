# Just a top_level_class_documentation comment :)
class Validator
  attr_accessor :access_key, :secret_key, :region, :service, :validation_result
  CONFIG = YAML.load_file('./conf/config.yml') unless defined? CONFIG
  def initialize
    @input_data = [
      { access_key: CONFIG['aws_access_key_id'],
        secret_key: CONFIG['aws_secret_access_key'] },
      { access_key: CONFIG['wrong_aws_access_key_id'],
        secret_key: CONFIG['wrong_aws_secret_access_key'] },
      { access_key: CONFIG['second_aws_access_key_id'],
        secret_key: CONFIG['second_aws_secret_access_key'] }
    ]
    @region = CONFIG['aws_region']
    @service = CONFIG['service']
  end

  def validate
    array = []
    @input_data.each do |hash|
      hash_data = valid_data(hash[:access_key], hash[:secret_key])
      array << hash_data if hash_data != false
    end
    array
  end

  def valid_data(access_key, secret_key)
    ec2 = Aws::EC2::Client.new(
      region: region,
      access_key_id: access_key,
      secret_access_key: secret_key
    )
    ec2.describe_regions
    { service: service,
      access_key_id: access_key,
      secret_access_key: secret_key }
    rescue
    false
  end
end
