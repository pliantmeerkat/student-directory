def print_header
  puts "the students of U Wot M8 Academy"
  puts "---------------------------------"
end

def print_names(students)
  students.each { |student| puts student }
end

def print_footer(num)
  print "unfortunately there are #{num} students"
end

students = [
  "Ginger Chav",
  "Chav Chavington",
  "Ali G",
  "Vicky Pollard",
  "Jeremy Corbyn",
  "All Fortnite Players",
  "H-Annibalzz",
  "Dr Lectoz",
  "Dex Lex AzluthorZizzle",
]
student_count = students.length

print_header
print_names(students)
print_footer(student_count)
