require 'octokit'
require 'ap'


Octokit::Client.new.gist('2288960').files.each do |c|
       puts c[0]
       puts "==================="
       puts c[1].content
       puts "==================="
   end