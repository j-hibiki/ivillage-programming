BRANCH  = "|-- "
VBRANCH = "| "
EBRANCH = "└ "
SPACE   = "  "

children = Dir.glob("#{ARGV[0]}/*")

puts ARGV[0]

for child in children do
  puts child.gsub(ARGV[0] + "/",BRANCH)
  grandChildren = Dir.glob("#{child}/*")

  for grandChild in grandChildren do
    if child == children[children.length-1] 
      puts grandChild.gsub(child+"/", " " + SPACE + BRANCH)
    else
      puts grandChild.gsub(child+"/", VBRANCH + SPACE + BRANCH)
    end
  end
end