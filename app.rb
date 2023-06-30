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

  def list_all_books
    if @books.empty?
      puts 'No books available.'
    else
      puts 'List of all books:'
      @books.each { |book| puts "#{book.title} by #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'No people available.'
    else
      puts 'List of all people:'
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    role_choice = gets.chomp.to_i

    case role_choice
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid role choice! Please try again.'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    classroom = 'classroom'

    print 'Has parent permission? [Y/N]: '
    keyword = gets.chomp.downcase

    if %w[n no].include?(keyword) || %w[y yes].include?(keyword)
      student = Student.new(classroom, age, name)
      @people << student
      puts 'Person created successfully.'
    # elsif %w[y yes].include?(keyword)
    #   student = Student.new(classroom, age, name)
    #   @people << student
    #   puts 'Person created successfully.'
    else
      puts "Invalid input. The keyword should be 'n' or 'y'."
    end
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(name, age, specialization)
    @people << teacher

    puts 'Person created successfully.'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book created successfully.'
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end

    book_index = gets.chomp.to_i
    book = @books[book_index]

    puts 'Select a person from the list by number (not ID):'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i
    person = @people[person_index]

    print 'Date: '
    date = gets.chomp

    Rental.new(date, book, person)
    puts 'Rental created successfully!'
  end

  def list_rentals_for_person
    print 'ID of the person: '
    person_index = gets.chomp.to_i
    person = @people.find { |p| p.id == person_index }

    if person.nil?
      puts 'Invalid person ID.'
    else
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end

  def exit_app
    puts 'Thank you for using this app.'
    exit
  end
end
