# -*- ruby -*-


begin
  require 'rubygems'
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "calendar_date_select"
    gemspec.version = File.read("VERSION").strip
    gemspec.summary = "A decendent of the great calendar_date_select project."
    gemspec.description = "Calendar date picker for rails"
    gemspec.email = ""
    gemspec.homepage = "http://github.com/locksmithdon/calendar_date_select"
    gemspec.authors = ["Shih-gian Lee", "Enrique Garcia Cota (kikito)", "Tim Charper", "Lars E. Hoeg"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

desc "Set the current gem version in the code according to the VERSION file"
task :set_version do
  VERSION = File.read("VERSION").strip
  abs_file = File.dirname(__FILE__) + "/lib/calendar_date_select/calendar_date_select.rb"
  src = File.read(abs_file)
  src = src.map do |line|
    case line
      when /^ *VERSION/ then "  VERSION = '#{VERSION}'\n"
    else
      line
    end
  end.join
  File.open(abs_file, "wb") { |f| f << src }
end
# vim: syntax=Ruby
