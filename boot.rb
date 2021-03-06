require 'awesome_print'
require 'dotenv/load'
require 'octokit'
require 'sequel'
require 'yaml'

CONFIG = YAML.load_file('config.yml')
DB = Sequel.connect(CONFIG['db_file'])
PROVIDER = %w[None]
TARGET = %w[None]

Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }

# Create aarays PROVIDER and PARSER from classes in folders
# classes/provider and classes/parser
providers = []
Dir.foreach('lib/providers').map { |x| File.basename(x) }.select do |y|
  providers << y.scan(/\b(.*)\_/)
end
providers.flatten!.each { |x| PROVIDER << x.capitalize unless x == 'base' }

targets = []
Dir.foreach('lib/parsers').map { |x| File.basename(x) }.select do |y|
  targets << y.scan(/\b(.*)\_/)
end
targets.flatten!.each { |x| TARGET << x.capitalize unless x == 'base' }
