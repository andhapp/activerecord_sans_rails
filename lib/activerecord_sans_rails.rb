require "activerecord_sans_rails/version"

module ActiverecordSansRails
  def self.load_rake_tasks
    Kernel.load "#{File.dirname(Kernel.__dir__)}/lib/activerecord_sans_rails/tasks/activerecord_sans_rails.rake"
  end
end
