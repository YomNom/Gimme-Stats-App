#!/usr/bin/ruby
# FILE: search.cgi
# Created by: Joey Yong
# Purpose: Gets values for insert and executes insert w/ query.cgi
# Notes: Didn't use drop down because I wanted to fill the page more
# Sources: Radio Buttons https://www.w3schools.com/html/html_forms.asp

puts "content-type:text/html"
puts ""
puts "<!DOCTYPE html>"
puts "<html>"
puts " <head>"
puts "  <title>Search</title>"
puts " </head>"
puts " <body>"
puts "  <h1>Search</h1>"
puts "  <form action = 'query.cgi'>"
puts "    Which field would you like to display? <br>"
puts "    <input type='radio' name='display' value='Date'>"
puts "    <label for='display'>Date</label><br>"
puts "    <input type='radio' name='display' value='Motion'>"
puts "    <label for='display'>Motion</label><br>"
puts "    <input type='radio' name='display' value='Brought_By'>"
puts "    <label for='display'>Brought By</label><br>"
puts "    <input type='radio' name='display' value='Final_Vote'>"
puts "    <label for='display'>Final Vote</label><br>"
puts "    <input type='radio' name='display' value='FileName'>"
puts "    <label for='display'>File Name</label><br>"
puts "    <input type='radio' name='display' 
           value='Date,Motion,Brought_By,Final_Vote,FileName'>"
puts "    <label for='display'>All of the Above</label><br>"
puts "    <br>"

puts "    Select field to search in:"
puts "    <br>"
puts "    <input type='radio' name='column' value='Date'>"
puts "    <label for='column'>Date</label><br>"
puts "    <input type='radio' name='column' value='Motion'>"
puts "    <label for='column'>Motion</label><br>"
puts "    <input type='radio' name='column' value='Brought_By'>"
puts "    <label for='column'>Brought By</label><br>"
puts "    <input type='radio' name='column' value='Final_Vote'>"
puts "    <label for='column'>Final Vote</label><br>"
puts "    <input type='radio' name='column' value='FileName'>"
puts "    <label for='column'>File Name</label><br>"
puts "    <br>"

puts "    Please enter what you would like to search"
puts "    <input name='query' type='text'><br>"

puts "    <input type='submit'><br>"   
puts "  </form><br>"
puts "  <a href = 'landing.html'>"
puts "      <button>Return</button>"
puts "  </a>"
puts " </body>"
puts "</html>"
