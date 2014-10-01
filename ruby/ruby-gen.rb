#!/usr/bin/env ruby 

# An executable ruby script generator.. this will save a little typing.
# - from the book "Practical Ruby for System Administration" by Andre Ben Hamou, APress
# 
# Usage: ./ruby-gen.rb test.rb

path = ARGV[0]
fail "[-] specify filename to create" unless path

puts "[+] creating file, " + path
File.open(path, "w") { |f| f.puts "#!/usr/bin/env ruby" }
File.chmod(0755, path)
system "open", path
