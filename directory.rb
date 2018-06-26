require 'fileutils' # for creating new files
require 'csv'

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
  #students.sort_by! { |k, v| k[:cohort]}
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
  name = STDIN.gets.chomp # or name.strip! if 1st and last chars whitespace :
                    # if name[1] && name[name.length -1] == " " then name.strip!
  while !name.empty? do
    puts "enter a cohort please"
    cohor = STDIN.gets.chomp
    students << { name: name, cohort: cohor }
    puts "#{students.count} students added"
    name = STDIN.gets.chomp
  end
  return students
end

def show_students(students)
  print_header
  print_names(students)
  print_footer(students.length)
end

def menu_select(selection, students, filename)
  case selection
    when "1"
      students += input_students
    when "2"
      show_students(students)
    when "3"
      write_file(students, "students.csv")
    when "4"
      puts "\nnote: this requires a restart to work"
      clear_file(filename)
    when "5"

    when "6"

    when "7"

    when "8"
      print_source_code
    when "9"
      exit
    else
      puts "oi oi batty boy put in a number siv vouz plaiz"
    end

  return students
end

def print_source_code

  $><<open($0).read # opens the source file $0 and prints it

end

def read_file(filename)
  output = []
  File.open(filename, "r") do |f|
    f.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      output << {name: name, cohort: cohort.to_sym}
      end
    end
  return output
end

def write_file(text, filename)
  CSV.open(filename, "a") do |f| # a so file is appended not re-written
    text.each do |student|
      f << [student[:name], student[:cohort]]
    end
  end
end

def clear_file(filename)
  File.open(filename, "w") do |f|
    f.print("") # will replace contents with empty string
  end
end

def interactive_menu
  filename = "students.csv" # default file value
  if !File.exists?(filename) # create new file if none present
    FileUtils.touch("students.csv")
  end
  students = read_file(filename)
  loop do

    puts "\n1. input students\n2. show students\n3. save to file\n" +
         "4. clear program data \n5. \n6. \n7. \n8. print code \n9. Exit"
    students = menu_select(STDIN.gets.chomp, students, filename)
  end
end

interactive_menu
student_count = students.length


=begin
if students.length > 0  # test for no additions by user
  print_names(students)
  print_footer(student_count)
  #first_letter(students, "j")
  #max_length(students)
else puts "error no students added" end
=end
