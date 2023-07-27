#!/usr/bin/env ruby

require 'yaml'
require 'net/http'

uri = URI('http://localhost:3803/sql')

puts "Reading 'repl.yaml'..."

config = YAML.load(File.read('repl.yaml'))
headers = { 'Content-Type': 'application/sql',
            'Accept': config['mime-type'] }

puts "Accepted MIME type set to: #{config['mime-type']}"
puts "ENTER to execute statement, CTRL+C to quit"

while true do
  puts ""
  print "SQL> "
  sql = gets

  res = Net::HTTP.post(uri, sql, headers)
  puts res.body
end
