ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../gems.rb', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
