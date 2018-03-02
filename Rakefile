require 'sequel'
require 'yaml'

Sequel.extension :migration

CONFIG = YAML.load_file('config.yml')
DB = Sequel.connect(CONFIG['db_file'])

namespace :db do
  desc 'Run migrations'
  task :migrate, [:version] do |_t, args|
    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(DB, 'db/migrate', target: args[:version].to_i)
    else
      puts 'Migrating to latest'
      Sequel::Migrator.run(DB, 'db/migrate')
    end
  end
end
