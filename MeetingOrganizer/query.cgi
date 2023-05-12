#!/usr/bin/ruby

# FILE: query.cgi
# Created by: Joey Yong
# Purpose: Action of Search
# Sources:
#     String interpolation http://ruby-for-beginners.rubymonstas.org/bonus/string_interpolation.html
#     printTableRow kmoorman.rb (Changed it a lot but put it here just in case)
#     Table https://www.w3schools.com/tags/tag_table.asp

require 'cgi'
cgi = CGI.new
require 'mysql2'
db = Mysql2::Client.new(:host=>'10.20.3.4',:username=>'jyong',:password=>'jyong0303C19', :database=>'jyong_dbA')

# placed hash into var to use interpolation
# Used it because it works
clmn = cgi['column']
match = cgi['query']
look = cgi['display']
entry = "select " + look + " from meeting where " + clmn + "=" + match

# Function: table
# Purpose: Make and input rows into a table
# Pre: String of display columns(separated by ,) and query passed in
# Post: Table made with rows
def table(clmnsToDisplay, entries)
  show = clmnsToDisplay.split(',')
  
  puts "<table style='width:100%'>"
  puts "<tr>"

  show.each do|see| 
    if see == 'Date'
      puts "<th>Date</th>"
    elsif see == 'Motion'
      puts "      <th>Motion</th>"
    elsif see == 'Brought_By'
      puts "<th>Brought By</th>"
    elsif see == 'Final_Vote'
      puts "      <th>Final Vote</th>"
    elsif see == 'FileName'
      puts "<th>Linked File</th>"
    end
  end 
  puts "</tr>"

# Inputs every database row into table
  entries.each do|row|
    puts "<tr>"
    printTableRow(show, row)
    puts "</tr>"
  end
  puts "  </table>"
end

# Function:   printTableRow
# Author:     Kenneth Moorman
# Purpose:    To pretty print an entire row of the table
# Pre:        A comma separated string of columns to print
#             A row as a hash has been generated and passed in
# Post:       That row is printed nicely to the screen 
def printTableRow (columnsToPrint, rowValues)
  #columns = columnsToPrint.split(',')
  
  columnsToPrint.each do |column|
    if (column=="Date") then # Date isn't a varchar
      puts "  <td>" + rowValues['Date'].to_s + "</td>"
    else
      puts "<td>" + rowValues[column] + "</td>"
    end
  end
end

puts "Content-type: text/html\r\n\r\n"
puts "<html>"
puts "  <head>"
puts "    <title>Query</title>"
puts "    <style>"
puts "      table, th, td {"
puts "         border: 1px solid black;"
puts "      }"
puts "    </style>"
puts "  </head>"
puts "  <body bgcolor = 'salmon'>"
puts "    <h2>Results:</h2>"

if look != "" then 
  if clmn != "" && match != "" then
    find = db.query("select #{look} from meeting where #{clmn}='#{match}'")
  else
    find = db.query("select #{look} from meeting")
  end
  if find.size < 1 
    puts "<h3>Nothing Found</h3>"
  else # no table if no row
    table(look, find)
  end
else # Nothing Selected
  puts "<h4>INVALID SEARCH</h4>"
end

puts "<br>"
puts "<a href = 'search.cgi'>"
puts "  <button>Search Again</button>"
puts "</a>"
puts "<a href = 'landing.html'>"
puts "  <button>Return</button>"
puts "</a>"
puts "  </body>"
puts "</html>"
