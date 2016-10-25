require "activerecord_sans_rails/version"
require "yaml"

module ActiverecordSansRails
  class << self
    attr_accessor :db_dir, :db_config_path, :db_config, :db_config_admin
  end

  def self.load_rake_tasks
    Kernel.load "#{File.dirname(Kernel.__dir__)}/lib/activerecord_sans_rails/tasks/activerecord_sans_rails.rake"
  end

  def self.load_environment( root_directory, environment, file_contents=nil )
    self.db_dir = "#{root_directory}/db"
    self.db_config_path = "#{root_directory}/config/database.yml"
    file_contents ||= YAML::load( File.open( self.db_config_path ) )[environment]
    self.db_config = file_contents
    self.db_config_admin = { 'database' => 'postgres', 'schema_search_path' => 'public' }.merge( self.db_config )
  end
end
