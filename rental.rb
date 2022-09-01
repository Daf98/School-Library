require './person'
require './book'

class Rental
  attr_accessor :book, :person, :date

  def initialize(book, person, date)
    @date = date
    @book = book
    @person = person
    book.rentals << self
    person.rentals << self
  end
end
