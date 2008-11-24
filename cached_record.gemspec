Gem::Specification.new do |s|
  s.name = 'cached_record'
  s.version = '0.0.1'
  s.date = '2008-10-27'

  s.summary = "memcached caching for active record"
  #s.description = ""

  s.authors = ['Kacper Cieśla']
  s.email = 'kacper.ciesla@gmail.com'
  s.homepage = ''

  s.has_rdoc = true
  s.rdoc_options = ['--main', 'README.txt']
  s.rdoc_options << '--inline-source' << '--charset=UTF-8'
  s.extra_rdoc_files = ['README.txt']

  s.test_files = %w{test/migrations test/migrations/create_notes.rb test/migrations/create_users.rb test/models test/models/note.rb test/models/original_user.rb test/models/original_note.rb test/models/user.rb test/test_cached_record.rb test/fixtures test/fixtures/users.yml test/cases test/cases/hello.rb test/environment.rb}
  s.files = %w{tasks tasks/bones.rake tasks/spec.rake tasks/notes.rake tasks/rubyforge.rake tasks/test.rake tasks/git.rake tasks/post_load.rake tasks/setup.rb tasks/svn.rake tasks/gem.rake tasks/ann.rake tasks/rdoc.rake tasks/manifest.rake Manifest.txt lib lib/cached_record lib/cached_record/base.rb lib/cached_record.rb Rakefile  README.txt History.txt}
end
