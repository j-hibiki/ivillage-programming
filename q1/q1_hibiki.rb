# 160112 変数名をsnake_caseに変更

BRANCH  = "|-- "
VBRANCH = "| "
EBRANCH = "└ "
SPACE   = "  "

children = Dir.glob("#{ARGV[0]}/*")

puts ARGV[0]

for child in children do
  puts child.gsub(ARGV[0] + "/",BRANCH)
  grand_children = Dir.glob("#{child}/*")

  for grand_child in grand_children do
    if child == children[children.length-1] 
      puts grand_child.gsub(child+"/", " " + SPACE + BRANCH)
    else
      puts grand_child.gsub(child+"/", VBRANCH + SPACE + BRANCH)
    end
  end
end

if ARGV.size != 1
  puts "Usage: ruby q1_hibiki.rb directory"
  exit
end