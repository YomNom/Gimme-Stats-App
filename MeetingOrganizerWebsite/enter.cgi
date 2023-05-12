#!/usr/bin/ruby
#
# FILE: enter.cgi
# Created by: Joey Yong
# Purpose: Action for insert

require 'cgi'
cgi = CGI.new
require 'mysql2'
db = Mysql2::Client.new(:host=>'10.20.3.4',:username=>'jyong',:password=>'jyong0303C19', :database=>'jyong_dbA')
# For interpolation 
date = cgi['dates']
motion = cgi['motion']
by = cgi['by']
vote = cgi['yes'] + "-" + cgi['no']
file = cgi['file']
# to print entered values for user
value = date + ", " + motion + ", " + by + ", " + vote + ", " + file 

puts "Content-type: text/html\r\n\r\n"
puts "<html>"
puts "  <head>"
puts "    <title>Insert</title>"
puts "  </head>"
puts "  <body>"
puts "    <h2>Your information has been completed</h2>"
puts "    <p>You have inserted "+ value + "</p>"

db.query("insert into meeting(Date, Motion, Brought_By, Final_Vote, FileName)VALUES('#{date}','#{motion}', '#{by}','#{vote}','#{file}')")

puts "<a href = 'landing.html'>"
puts "  <button>Return</button>"
puts "</a>"
puts "<a href = 'insert.cgi'>"
puts "  <button>Insert Again</button>"
puts "</a>"
puts "  </body>"
puts "</html>"



