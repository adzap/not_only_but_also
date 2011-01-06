require 'rubygems'
require 'rspec'

require 'active_support/dependencies'
require 'not_only_but_also'

RAILS_ROOT = File.join(File.dirname(__FILE__), 'rails_root')

ActiveSupport::Dependencies.autoload_paths = %W( #{RAILS_ROOT}/app #{RAILS_ROOT}/app/models )
