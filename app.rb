require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end
  attr_reader :people, :books, :rental

  # Create UI
  def menu_selector
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a teacher'
    puts '4 - Create a student'
    puts '5 - Create a book'
    puts '6 - Create a rental'
    puts '7 - List all rentals for a given person'
    puts '0 - Quit app'
  end

  # Turn input into methods for the user
  def run
    menu_selector
    menu_options = {
      '1' => method(:list_books),
      '2' => method(:list_people),
      '3' => method(:create_teacher),
      '4' => method(:create_student),
      '5' => method(:create_book),
      '6' => method(:create_rental),
      '7' => method(:list_rentals)
    }
    input = gets.chomp

    # Call methods depending on input
    if input.to_i.> 0 && input.to_i < 7
      menu_options[input].call
    elsif input.zero?
      puts 'Thank you for using this app!'
    else
      puts 'Error: wrong number input'
      run
    end
  end

  ## Create methods

  # 1 - List all books

  def list_books
    puts 'List of books:'
    @books.each_with_index do |book, _index|
      puts `#{index + 1} - #{book.title} by #{book.author}`
    end
    show_link_to_main
  end

  # 2 - List all people
  def list_people
    puts 'List of people:'
    @people.each do |person|
      puts person.name
    end
    show_link_to_main
  end

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

  # 3.a - Create a student
  def create_student
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp
    print 'Does this student have parental permission?: [Y/N]'
    parent_permission = true if gets.chomp == 'Y'
    new_student = Student.new(name, age, classroom, parent_permission)
    @people.push(new_student)
    puts 'Student created successfully!'
    run
  end

  # 3.a - Create a student
  def create_teacher
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    new_teacher = Teacher.new(name, age, specialization)
    @people.push(new_teacher)
    puts 'Student created successfully!'
    run
  end

  def create_book
    # create book
  end

  def create_rental
    # create rental
  end

  def list_rentals(id)
    # list rental according to student id
  end
end
