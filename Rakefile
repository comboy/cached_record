# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

load 'tasks/setup.rb'

ensure_in_path 'lib'
require 'cached_record'

task :default => 'spec:run'

PROJ.name = 'cached_record'
PROJ.authors = 'Kacper Cieśla (comboy)'
PROJ.email = 'kacper.ciesla@gmail.com'
PROJ.url = 'FIXME (project homepage)'
PROJ.rubyforge.name = 'cached_record'

PROJ.spec.opts << '--color'


namespace :test do
  desc 'Prepare data for testing'
  task :prepare do
    require 'test/environment'
    CachedRecord::TestEnvironment.setup_db
  end
end

# EOF
