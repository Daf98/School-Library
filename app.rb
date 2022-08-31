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
  attr_accessor :people, :books, :rentals

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
  end

  # 6 - List all rentals for a given person id
  def list_rentals
    puts 'ID of person:'
    person_id = gets.chomp.to_i
    @rentals.filter do |rental|
      puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
    end
  end

  # Save data
  def save
    # emtpy JSON file
    File.write('./books.json', '', mode: 'w')
    # for each book in array, generate a JSON object with it
    # and append it to the JSON file into a new line
    list_books.each do |book|
      json_book = JSON.generate(book)
      File.write('./books.json', "#{json_book}\n", mode: 'a')
    end
  end

  # Retrieve data
  def retrieve
    # if the JSON file is empty, start 'write' mode
    File.open('./books.json', 'w') unless File.exist?('./books.json')
    # if the JSON file is not empty, keep 'append' mode
    # emptying book array
    @books = []
    # add books from JSON to book array
    File.foreach('./books.json') do |line|
      @books << JSON.parse(line, create_additions: true)
    end
    # return book array
    @books
  end
end
