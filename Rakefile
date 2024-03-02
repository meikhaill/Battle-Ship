# Rakefile

# Load RSpec and define task for running all spec files
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = 'spec/**/*_spec.rb' # Adjust the pattern to match your spec file naming convention
end

task default: :spec