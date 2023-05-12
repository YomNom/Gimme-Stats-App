#!/usr/bin/ruby

# The dates = dates.strip accomplishes nothing
# varchar for small fields is wasteful
#
# FILE: insert.cgi
# Created by: Joey Yong
# Purpose: Insert information into table meeting
# Sources:
#   Input Type Number https://www.w3schools.com/html/html_form_input_types.asp
#   Reset https://www.w3schools.com/tags/att_input_type_reset.asp#:~:text=The%
#         20%3Cinput%20type%3D%22reset,values%20to%20its%20initial%20values.

# Read in dates to make layout less messy if put in middle
# Only one txt file will be used here so no check
meet = IO.readlines("date.txt")
meet.each do |dates|
  dates = dates.strip
end

puts "content-type:text/html"
puts ""
puts "<!DOCTYPE html>"
puts "<html>"
puts " <head>"
puts "  <title>Insert</title>"
puts " </head>"
puts " <body>"
puts " <h1>Enter what information you would like to enter:</h1>"
puts "  <form action = 'enter.cgi'>"
puts "    Date of Meeting: "
puts "    <select name = 'dates'>"
puts "      <option value = " + meet[0] + ">" + meet[0] + "</option>"
puts "      <option value = " + meet[1] + ">" + meet[1] + "</option>"
puts "      <option value = " + meet[2] + ">" + meet[2] + "</option>"
puts "      <option value = " + meet[3] + ">" + meet[3] + "</option>"
puts "      <option value = " + meet[4] + ">" + meet[4] + "</option>"
puts "      <option value = " + meet[5] + ">" + meet[5] + "</option>"
puts "    </select>"
puts "    <br>"

puts "    Motion: "
puts "    <input name = 'motion' type = 'text'><br>"
puts "    Motion brought by?"
puts "    <input name = 'by' type = 'text'><br>"

# Separate yes and no to little user error
# Number input so user doesn't put anything invalid
puts "    How many yes votes?"
puts "    <input name = 'yes' type = 'number' min='0' max='90'><br>"
puts "    How many no votes?"
puts "    <input name = 'no' type = 'number' min='0' max ='90'><br>"

puts "    What file should be linked to this motion?"
puts "    <input name = 'file' type 'text'>"
puts "    <br><br>"
puts "    <input type = 'reset'>"
puts "    <input type = 'submit'>"
puts "  </form>"
puts "  <br>"
# Submits if in form
puts "  <a href = 'landing.html'>"
puts "    <button>Return</button>"
puts "  </a>"
puts " </body>"
puts "</html>"
