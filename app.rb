require_relative 'person_class'
require_relative 'student_class'
require_relative 'teacher_class'
require_relative 'book_class'
require_relative 'rental_class'
require './trimmer_decorator'
require './capitalize_decorator'

class App
  def initialize
    @people = []
    @books = []
  end

  def run
    puts "Welcome to Shool Library App!"

    loop do
      puts "\nPlease Choose an option by enterin a number:"
      puts "1. List all books"
      puts "2. List all people"
      puts "3. Create a person"
      puts "4. Create a book"
      puts "5. Create a rental"
      puts "6. List all rentals for a given person id"
      puts "7. Exit"

      choice = gets.chomp.to_i

      case choice
      when 1
        list_all_books
      when 2
        list_all_people
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        list_rentals_for_person
      when 7
        exit_app
      else
        puts "Invalid choice! Please try again."
      end
    end
  end

  private

  def list_all_books
    if @books.empty?
      puts "No books available."
    else
      puts "List of all books:"
      @books.each { |book| puts "#{book.title} by #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts "No people available."
    else
      puts "List of all people:"
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} "}
    end
  end
  def create_person
   print "Do you want to create a student (1) or a teacher (2)? [Input the number]:"
    role_choice = gets.chomp.to_i
    case role_choice
    when 1    
     create_student()
    when 2
      create_teacher()
    else
      puts "Invalid role choice! Please try again."
    end
  end

  def create_student()
    print "age:"
    age = gets.chomp.to_i
    print "Name:"
    name = gets.chomp
    classroom="classroom"
    print "Has parent permission? [Y/N]: "
    keyword = gets.chomp
  if keyword == "n" || keyword == "N"
   student = Student.new(classroom,age,name)
   @people << student
   puts "Person created successfully"
  elsif keyword == "y" || keyword == "Y"
    student = Student.new(classroom,age,name)
    @people << student
    puts "Person created successfully"
  else
    puts "The keyword is neither 'n' nor 'y'"
  end  
    
  end

  def create_teacher()
    print "age:"
    age = gets.chomp.to_i
    print "Name:"
    name = gets.chomp
    print "specialization:"
    specialization = gets.chomp
  
    parent_permission = true
    teacher = Teacher.new(name, age, specialization)
    @people << teacher
    print "Person created successfully"
  end

  def create_book
    print "Title:"
    title = gets.chomp
    print "Author:"
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "Book created successfully"
  end

  def create_rental

    puts 'Select a book from following list by number '
    @books.each_with_index do |book, index|
    puts "#{index}) Title: #{book.title} , Author: #{book.author}"
    end

    book_index = gets.chomp.to_i
    book = @books[book_index]
    puts 'Select a person from the list by number(not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i
    person = @people[person_index]
    print 'Date: '
    date = gets.chomp
    Rental.new(date, book, person)
    puts "Rental created successfully!"
    end
  
  def list_rentals_for_person
    print 'ID of person:'
    person_index = gets.chomp.to_i
    person = @people.find { |p| p.id == person_index }
    
    if person.nil?
      puts "Invalid person index"
    else
      person.rentals.each do |rental|
        puts " Date: #{rental.date}, Book: #{rental.book.title} ,by #{rental.book.author}"
      end
    end
  end

  def exit_app
    puts "Thank you using this app"
    exit
  end
end

app = App.new
app.run
