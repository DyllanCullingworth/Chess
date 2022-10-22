
def clear
  print "\e[2J\e[H"
end

def prompt(message)
  puts message
  gets.chomp
end