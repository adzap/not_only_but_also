require 'rubygems'
require 'rake/rdoctask'
require 'rake/gempackagetask'
require 'rubygems/specification'
require 'rspec/core/rake_task'

GEM_NAME = "not_only_but_also"
GEM_VERSION = '1.0.0'
AUTHOR   = "Adam Meehan"
EMAIL    = "adam.meehan@gmail.com"
HOMEPAGE = "http://github.com/adzap/not_only_but_also"
SUMMARY  = "Rails plugin to split large models into separate files of concern. Like concerned_with but a little more convenient."

spec = Gem::Specification.new do |s|
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.rubyforge_project = "not_only_but_also"
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc"]
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  
  s.require_path = 'lib'
  s.autorequire = GEM_NAME
  s.files = %w(MIT-LICENSE README.rdoc Rakefile) + Dir.glob("{lib,spec,generators}/**/*")
end

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new(:spec)

desc "Generate code coverage"
RSpec::Core::RakeTask.new(:coverage) do |t|
  t.rcov = true
end

desc 'Generate documentation for plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'NotOnlyButAlso'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "install the gem locally"
task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM_NAME}-#{GEM_VERSION}}
end

desc "create a gemspec file"
task :make_spec do
  File.open("#{GEM_NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end
