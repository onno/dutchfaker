require 'rake/rdoctask'

Rake::RDocTask.new do |rdoc|
  files = ['README.txt', 'License.txt', 'history.txt', 'lib/**/*.rb', 'doc/**/*.rdoc', 'test/*.rb']
  rdoc.rdoc_files.add(files)
  rdoc.main = 'README.txt'
  rdoc.title = 'dutchfaker'
  rdoc.template = '/Library/Ruby/Gems/1.8/gems/allison-2.0.3/lib/allison'
  rdoc.rdoc_dir = 'doc'
  rdoc.options << '--line-numbers' << '--inline-source'
end