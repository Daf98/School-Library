require './rental'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
  attr_accessor :title, :author
  attr_reader :rental

  # Create the has-many side of Book and Rental (a book has many rentals).
  def add_rentals(rental)
    @rentals.push(rental)
    rental.book = self
  end
end
