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

Dir[File.dirname(__FILE__) + '/classes/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }
