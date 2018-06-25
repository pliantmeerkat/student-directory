def print_header
  puts "the students of U Wot M8 Academy"
  puts "---------------------------------"
end

def print_names(students)
  # i = 0
  # until i == students.length
  #   puts "#{i+1}: #{students[i][:name]} (#{students[i][:cohort]}) cohort"
  #   i += 1
  # end
  # by cohort
  students.sort_by! { |k, v| k[:cohort]}
  students.each_with_index do |student, i|
     puts "#{i+1}: #{student[:name]} (#{student[:cohort]}) cohort"
   end
  
end

def first_letter(students, l)

  students.each { |student| if student[:name][0] == l
                           puts "#{student[:name]}" end }
end

def max_length(students, l=12)
  students.each { |student| puts student[:name].length < 12 ? student[:name]
                                                            : ""}
end

def print_footer(num)
  print "unfortunately there "
  print num > 1 ? "are #{num} students" : "is #{num} student"
end

def input_students
  puts "enter the names of the students".center(12),
        "to finish enter return twice".center(8)
  students = []
  name = gets.chomp # or name.strip! if 1st and last chars whitespace :
                    # if name[1] && name[name.length -1] == " " then name.strip!
  while !name.empty? do
    puts "enter a cohort please"
    cohor = gets.chomp
    students << { name: name, cohort: cohor }
    puts "now we have #{students.count} students"
    name = gets.chomp
  end
  return students
end


print_header
students = input_students

student_count = students.length
if students.length > 0  # test for no additions by user
  print_names(students)
  print_footer(student_count)
  #first_letter(students, "j")
  #max_length(students)
else puts "error no students added" end
