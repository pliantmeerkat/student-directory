def print_header
  puts "the students of U Wot M8 Academy"
  puts "---------------------------------"
end

def print_names(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]}) cohort"
  end
end

def print_footer(num)
  print "unfortunately there are #{num} students"
end

students = [
  { name: "Ginger Chav", cohort: :november },
  { name: "Chav Chavington", cohort: :december },
  { name: "Ali G", cohort: :february },
  { name: "Vicky Pollard", cohort: :june },
  { name: "Jeremy Corbyn", cohort: :december },
  { name: "All Fortnite Players", cohort: :may },
  { name: "H-Annibalzz", cohort: :september },
  { name: "Dr Lectoz", cohort: :july },
  {name: "Dex Lex AzluthorZizzle", cohort: :september }
]
student_count = students.length

print_header
print_names(students)
print_footer(student_count)
