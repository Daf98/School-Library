require './person'
require './book'

class Rental
  def initialize(date)
    @date = date
    @rentals = []
    # Modify the constructor of Rental so Book and Person are set in it.
    @book = book
    book.rental << self

    @person = person
    person.rental << self
  end

  attr_reader :rentals
  attr_accessor :date
  # Create the belongs-to side of Rental and Book (a rental belongs to a book).
  attr_accessor :book
  # Create the belongs-to side of Rental and Person (a rental belongs to a person).
  attr_accessor :person
end
