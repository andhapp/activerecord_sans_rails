require 'spec_helper'

describe ActiverecordSansRails do

  it 'has a version number' do
    expect(ActiverecordSansRails::VERSION).not_to be nil
  end

  context 'load_rake_tasks' do

    it 'makes correct calls' do
      allow(Kernel).to receive(:__dir__) { "/rootDir" }
      allow(File).to receive(:dirname).with("/rootDir") { "/rootDir" }
      allow(Kernel).to receive(:load).
        with("/rootDir/lib/activerecord_sans_rails/tasks/activerecord_sans_rails.rake")

      ActiverecordSansRails::load_rake_tasks
    end

  end

end
