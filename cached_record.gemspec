Gem::Specification.new do |s|
  s.name = 'cached_recard'
  s.version = '0.0.1'
  s.date = '2008-10-26'

  s.summary = "memcached caching for active record"
  #s.description = ""

  s.authors = ['Kacper Cieśla']
  s.email = 'kacper.ciesla@gmail.com'
  s.homepage = ''

  s.has_rdoc = false
  #s.rdoc_options = ['--main', 'README.rdoc']
  #s.rdoc_options << '--inline-source' << '--charset=UTF-8'
  #s.extra_rdoc_files = ['README.rdoc', 'LICENSE', 'CHANGELOG.rdoc']

  s.test_files = Dir.glob("test/**/*").collect
  s.files = Dir.glob("test/**/*").collect - Dir.glob("test/**/*").collect
end