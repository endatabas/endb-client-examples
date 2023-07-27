#!/usr/bin/env ruby

require 'yaml'
require 'json'
require 'csv'
require 'net/http'
require 'tty-prompt'
require 'terminal-table'

prompt = TTY::Prompt.new(interrupt: :exit)
uri = URI('http://localhost:3803/sql')
puts "From 'repl.yaml':"
config = YAML.load(File.read('repl.yaml'))
headers = { 'Content-Type': 'application/sql',
            'Accept': config['mime-type'] }
puts " - MIME type: #{config['mime-type']}"
puts " - Output:    #{config['output']}"
puts "ENTER to execute statement, CTRL+C to quit"

def rich_json_output?(config)
  config['output'] == "cooked" &&
    ['application/json', 'application/ld+json'].include?(config['mime-type'])
end

def rich_csv_output?(config)
  config['output'] == "cooked" &&
    config['mime-type'] == "text/csv"
end

def draw_csv_table(res)
  csv = CSV.parse(res.body, headers: true)
  headers = csv.headers
  csva = csv.to_a.drop(1)
  Terminal::Table.new(headings: headers, rows: csva)
end

while true do
  puts ""
  sql = prompt.ask("SQL>")
  res = Net::HTTP.post(uri, sql, headers)
  if rich_csv_output?(config) then
    puts draw_csv_table(res)
  elsif rich_json_output?(config)
    puts JSON.parse(res.body).to_s
  else
    puts res.body
  end
end
