$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(File.join(File.dirname(__FILE__), '..', 'spec'))

require 'rubygems'
require 'spec/autorun'

require 'active_record'
require 'active_support'
require 'not_only_but_also'

RAILS_ROOT = File.join(File.dirname(__FILE__), 'rails_root')

ActiveRecord::Migration.verbose = false
ActiveRecord::Base.establish_connection({:adapter => 'sqlite3', :database => ':memory:'})

require 'schema'

ActiveSupport::Dependencies.load_paths = %W( #{RAILS_ROOT}/app #{RAILS_ROOT}/app/models )
