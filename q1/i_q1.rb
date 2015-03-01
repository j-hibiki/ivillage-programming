#!/usr/bin/env ruby
# encoding: utf-8

def Search_items(dir,roop)
	#p roop,dir
	ab_path = File.expand_path(dir)
	roop += 1
	tab = Calc_Tab(roop)
	Dir::foreach(ab_path){|item|
		if item != "." and item != ".." and roop <= 2 then 
			if roop > 0 then print "|" end 
			print("#{tab}")
			puts "|-- #{item}"
			if File::ftype("#{ab_path}/#{item}") == "directory" then
				Dir::chdir("#{ab_path}/") do
	  				Search_items(item,roop)
	  			end
	  		end
  		end
	}
end

def Calc_Tab(roop)
	tab,num = "",0
	while num < roop do
		tab += "   "
		num += 1
	end
	return tab
end

# Program Start
p "Show a Directory Tree until second times more deeply."
# @author = icchida
# @date   = 2015.03.01
# @Language = ruby and english
# ex: # i_q1.rb <directory>

# current directory
p "---- Searching Dir - [#{ARGV[0]}]  - "
puts ARGV[0]
Search_items(ARGV[0],0)
