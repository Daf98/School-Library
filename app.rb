require './student'
require './teacher'
require './book'
require './rental'
require './list_books'
require './list_people'
require './create_rental'


class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end
  attr_reader :people, :books, :rentals

  # Create main interface
  def go_back
    puts 'Type 0 to go back to the menu'
    if gets.chomp == '0'
      run
    else
      puts 'Error: wrong input'
      go_back
    end
  end

  # Create UI
  def menu_selector
    puts 'Welcome to School Library App!'
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person ID'
    puts '7 - Exit'
  end

  # Turn input into methods for the user
  def run
    menu_selector
    menu_options = {
      '1' => method(:list_books),
      '2' => method(:list_people),
      '3' => method(:create_person),
      '4' => method(:create_book),
      '5' => method(:create_rental),
      '6' => method(:list_rentals)
    }
    input = gets.chomp

    # Call methods depending on input
    if input.to_i.positive? && input.to_i < 7
      menu_options[input].call
    elsif input.to_i == 7
      puts 'Thank you for using this app!'
    else
      puts 'Error: wrong number input.'
      run
    end
  end

  ## Create methods

  # 1 - List all books

  include ListBooks
  include ListPeople
  include CreateRental
  
  # 3 - Create a person
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    number = gets.chomp.to_i
    case number
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid number, please type 1 to create a student or 2 to create a teacher.'
    end
  end

  # 3a - Create a student
  def create_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Does this student have parental permission?: [Y/N]'
    parent_permission = true if gets.chomp == 'Y'
    new_student = Student.new(age, name, parent_permission:)
    @people.push(new_student)
    puts 'Student created successfully'
    run
  end

  # 3b - Create a teacher
  def create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    new_teacher = Teacher.new(age, specialization, name)
    @people.push(new_teacher)
    puts 'Teacher created successfully'
    run
  end

  # 4 - Create a book
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
    run
  end

  # 6 - List all rentals for a given person id
  def list_rentals
    puts 'ID of person:'
    person_id = gets.chomp.to_i
    @rentals.filter do |rental|
      puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
    end
  end
end
