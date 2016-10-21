require "active_record"

namespace :db do

  task :environment do
    env = ENV['APP_ENV'] || 'development'
    ActiverecordSansRails.load_environment( Rake.application.original_dir, env )
  end

  desc "Create the database"
  task :create => :environment do
    ActiveRecord::Base.establish_connection(ActiverecordSansRails.db_config_admin)
    ActiveRecord::Base.connection.create_database(ActiverecordSansRails.db_config["database"])
    puts "Database created."
  end

  desc "Migrate the database"
  task :migrate => :environment do
    ActiveRecord::Base.establish_connection(ActiverecordSansRails.db_config)
    ActiveRecord::Migrator.migrate("#{ActiverecordSansRails.db_dir}/migrate/")
    Rake::Task["db:schema"].invoke
    puts "Database migrated."
  end

  desc "Drop the database"
  task :drop => :environment do
    ActiveRecord::Base.establish_connection(ActiverecordSansRails.db_config_admin)
    ActiveRecord::Base.connection.drop_database(ActiverecordSansRails.db_config["database"])
    puts "Database deleted."
  end

  desc "Reset the database"
  task :reset => [:drop, :create, :migrate]

  desc 'Create a db/schema.rb file that is portable against any DB supported by AR'
  task :schema => :environment do
    ActiveRecord::Base.establish_connection(ActiverecordSansRails.db_config)
    require 'active_record/schema_dumper'
    filename = "#{ActiverecordSansRails.db_dir}/schema.rb"
    File.open(filename, "w:utf-8") do |file|
      ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
    end
  end

end

namespace :g do
  desc "Generate migration"
  task :migration => :"db:environment" do
    name = ARGV[1] || raise("Specify name: rake g:migration your_migration")
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    path = File.expand_path("#{ActiverecordSansRails.db_dir}/migrate/#{timestamp}_#{name}.rb", __FILE__)

    migration_class = name.split("_").map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<-EOF
        class #{migration_class} < ActiveRecord::Migration
          def self.up
          end
          def self.down
          end
        end
      EOF
    end

    puts "Migration #{path} created"
    abort # needed stop other tasks
  end
end
