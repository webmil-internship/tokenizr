require 'awesome_print'
require 'dotenv/load'
# require 'net/http'
require 'octokit'
require 'sequel'
# require 'uri'
require 'yaml'

CONFIG = YAML.load_file('config.yml')
DB = Sequel.connect(CONFIG['db_file'])
IP = CONFIG['ip_address'].freeze
PORT = CONFIG['ip_port'].freeze
PROVIDER = %w[None]
TARGET = %w[None]

Dir[File.dirname(__FILE__) + '/classes/**/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }

providers = []
Dir.foreach('classes/provider').map {|x| File.basename(x)}.select { |x| providers << x.scan(/\b(.*)\_/)}
providers.flatten!.each {|x| PROVIDER << x.capitalize unless x == 'base'}

targets = []
Dir.foreach('classes/parser').map {|x| File.basename(x)}.select { |x| targets << x.scan(/\b(.*)\_/)}
targets.flatten!.each {|x| TARGET << x.capitalize unless x == 'base'}
