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

  def list_books
    # list all books
  end

  def list_people
    # list all people
  end

  def create_person
    # create student or teacher
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
