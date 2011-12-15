#!/usr/bin/ruby
require_relative 'Controller.rb'

if ARGV.size < 1 
  puts "Usage:  "
  puts "  climain <mode> "
  puts "Modes:"
  puts "  cli"
  puts "  clientserver"
  exit 
end 

cont = Controller.new ARGV[0]

