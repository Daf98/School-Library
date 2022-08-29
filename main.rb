require './app'

class Main
  attr_reader :people, :books, :rentals
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
    def run_options(option)
      app = App.new 
      case option
      when 1
        app.list_books
        go_back
      when 2
        app.list_people
        go_back
      when 6
        app.list_rentals
        go_back
      when 7
        puts 'Goodbye'
        exit
      when 4
        app.create_book
        menu_selector
      when 5
        app.create_rental
        menu_selector
      when 3
        app.create_person
        menu_selector
      end
    end

    # Call methods depending on input
    # if input.to_i.positive? && input.to_i < 7
    #   menu_options[input].call
    # elsif input.to_i == 7
    #   puts 'Thank you for using this app!'
    # else
    #   puts 'Error: wrong number input.'
    #   run
    # end
  end
Main.new.menu_selector
