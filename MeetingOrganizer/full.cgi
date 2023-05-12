#!/usr/bin/ruby
# FILE: full.cgi
# Created by: Joey Yong
# Purpose: Display whole database
# Note: Table Columns:  Date, Motion, Brought_By, Final_Vote, FileName
# Sources:
#     printTableRow kmoorman.rb (Changed it a lot but put it here just in case)
#     Table https://www.w3schools.com/tags/tag_table.asp
#
require 'mysql2'
db = Mysql2::Client.new(:host=>'10.20.3.4',:username=>'jyong',:password=>'jyong0303C19', :database=>'jyong_dbA')

# Function:   printTableRow
# Author:     Kenneth Moorman
# Purpose:    To pretty print an entire row of the table
# Pre:        A comma separated string of columns to print
#             A row as a hash has been generated and passed in
# Post:       That row is inserted into table 
def printTableRow (columnsToPrint, rowValues)
  columns = columnsToPrint.split(',')
 
  columns.each do |column|
    if column == "Date" # Date isn't a string so it's converted
      puts "  <td>" + rowValues['Date'].to_s + "</td>"
    else
      puts "<td>" + rowValues[column] + "</td>"
    end
  end
end
puts "content-type:text/html"
puts ""
puts "<!DOCTYPE html>"
puts "<html>"
puts " <head>"
puts "  <title>Display Everything</title>"
puts "  <style>" # Gives table borders
puts "    table, th, td {"
puts "       border: 1px solid black;"
puts "    }"
puts "  </style>"
puts " </head>"
puts " <body>"
puts "  <h2>Meeting Database:</h2>"

fields = "Date,Motion,Brought_By,Final_Vote,FileName" # Used to make an array for columns
all = db.query("select * from meeting")

puts "  <table style='width:100%'>"
puts "    <tr>"
puts "      <th>Date</th>"
puts "      <th>Motion</th>"
puts "      <th>Brought By</th>"
puts "      <th>Final Vote</th>"
puts "      <th>Linked File</th>"
puts "    </tr>"

# Inputs every database row into table
all.each do|entry|
  puts "<tr>"
  printTableRow(fields, entry)
  puts "</tr>"
end

puts "  </table>"
puts "  <br> <a href = 'landing.html'>"
puts "    <button>Return</button>"
puts "  </a>"
puts " </body>"
puts "</html>"
