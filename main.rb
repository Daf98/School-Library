require './app'
require 'json'

class Main
  def initialize
    @app = App.new
  end
  attr_accessor :people, :books, :rentals

  # Create main interface
  def go_back
    puts 'Type 0 to go back to the menu'
    if gets.chomp == '0'
      menu_selector
    else
      puts 'Error: wrong input'
      go_back
    end
  end

  # Create UI
  def menu_selector
    # books_books = File.read('./books.json')
    # parsed_books = JSON.parse(books_books)
    # puts parsed_books
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
    option = gets.chomp.to_i
    run_options(option)
  end

  # Turn input into methods for the user
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/CyclomaticComplexity
  def run_options(option)
    case option
    when 1
      @app.list_books
      go_back
    when 2
      @app.list_people
      go_back
    when 3
      @app.create_person
      menu_selector
    when 4
      @app.create_book
      menu_selector
    when 5
      @app.create_rental
      menu_selector
    when 6
      @app.list_rentals
      go_back
    when 7
      puts 'Thank you for using this app!'
      ## Preserving data in files

      # Preserving books
      books = @app.instance_variable_get(:@books)
      json_books = JSON.generate(books)
      File.write('books.json', json_books, mode: 'a') unless File.zero?('books.json')

      # Preserving people
      people = @app.instance_variable_get(:@people)
      unless File.zero?('people.json')
        json_people = JSON.generate(people)
        File.write('people.json', json_people, mode: 'a')
      end

      # Preserving rentals
      rentals = @app.instance_variable_get(:@rentals)
      json_rentals = JSON.generate(rentals)
      File.write('rentals.json', json_rentals, mode: 'a') unless File.zero?('rentals.json')
      exit
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity
end
Main.new.menu_selector
