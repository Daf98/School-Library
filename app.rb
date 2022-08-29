require './student'
require './teacher'
require './book'
require './rental'
require './list_books'

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
  # def list_books
  #   puts 'List of books:'
  #   @books.each_with_index do |book, _index|
  #     puts "Title: '#{book.title}', Author: #{book.author}"
  #   end
  # end

  # 2 - List all people
  def list_people
    puts 'List of people:'
    @people.each_with_index do |person, _i|
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
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

  # 5 - Create a rental
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  # rubocop:disable Metrics/CyclomaticComplexity
  def create_rental
    if @books.length.positive? && @people.length.positive?
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index + 1} - #{book.title} by #{book.author}" }
      book_index = gets.chomp
      unless book_index.to_i.positive? && book_index.to_i <= @books.length
        puts 'Invalid book number, please try again'
        create_rental
      end
      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index { |person, i| puts "#{i + 1}) #{person.name}, ID: #{person.id}, Age: #{person.age}" }
      person_index = gets.chomp
      unless person_index.to_i.positive? && person_index.to_i <= @people.length
        puts 'Invalid person number, please try again'
        create_rental
      end
      print 'Date: '
      date = gets.chomp
      new_rental = Rental.new(@books[book_index.to_i - 1], @people[person_index.to_i - 1], date)
      @rentals.push(new_rental)
      puts 'Rental created successfully'
    else
      puts 'No books/people found'
    end
  end

  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity
  # rubocop:enable Metrics/CyclomaticComplexity
  # 6 - List all rentals for a given person id
  def list_rentals
    puts 'ID of person:'
    person_id = gets.chomp.to_i
    @rentals.filter do |rental|
      puts "Date: #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
    end
  end
end
