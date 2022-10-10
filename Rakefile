require 'rubocop/rake_task'
require 'rspec/core/rake_task'

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'spec/**/*.rb', '*.rb']
  task.fail_on_error = false
end

RSpec::Core::RakeTask.new(:spec)

task :lint_spec => [:lint, :spec]

task :default => [:lint_spec]