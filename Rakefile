require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "immutable_attributes"
    gem.summary = %Q{Selected attributes are permanent once a record is created}
    gem.description = %Q{Allows specified attributes to be freely overwritten _until_ the record is saved for the first time}
    gem.email = "gemcutter@jackcanty.com"
    gem.homepage = "http://github.com/JackDanger/immutable_attributes"
    gem.authors = ["Jack Danger Canty", "Terry Heath", "Nicholas Mertaugh"]
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << '.'
  test.pattern = 'test/*_test.rb'
  test.verbose = true
end
task :default => :test

