require 'rubygems'
require 'bundler/setup'

### MAGIC HAPPENS HERE
require_relative "db/setup"
Dir.glob("./models/**.rb").each {|f| require f}

puts "Ready!"
