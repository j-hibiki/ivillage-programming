BRANCH = '|-- '
VERTICAL_BRANCH = '|   '
SPACE = '    '

def create_tree(dir)
  tree = dir.dup + "\n"

  children = Dir.glob("#{dir}/*")
  children.each do |child|
    tree << child.gsub(/#{dir}\//, BRANCH) + "\n"

    grand_children = Dir.glob("#{child}/*")
    grand_children.each do |grand_child|
      replaced = (child == children.last) ? (SPACE + BRANCH) : (VERTICAL_BRANCH + BRANCH)
      tree << grand_child.gsub(/#{child}\//, replaced) + "\n"
    end
  end

  tree
end

if ARGV.size != 1
  puts "Usage: ruby answer_mura-s.rb directory"
  exit
end

puts create_tree(ARGV[0])
