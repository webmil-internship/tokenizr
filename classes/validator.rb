# Just a top_level_class_documentation comment :)
class Validator
  attr_accessor :access_key, :secret_key, :region
  CONFIG = YAML.load_file('./conf/config.yml') unless defined? CONFIG
  def initialize
    @input_data = [
      { access_key: CONFIG['aws_access_key_id'],
        secret_key: CONFIG['aws_secret_access_key'] },
      { access_key: CONFIG['wrong_aws_access_key_id'],
        secret_key: CONFIG['wrong_aws_secret_access_key'] }
    ]
    @region = CONFIG['aws_region']
  end

  def validate
    @input_data.each do |hash|
      puts amazon(hash[:access_key], hash[:secret_key])
    end
  end

  def amazon(access_key, secret_key)
    ec2 = Aws::EC2::Client.new(
      region: @region,
      access_key_id: access_key,
      secret_access_key: secret_key
    )
    ec2.describe_regions
    true
   rescue
    false
  end
end
