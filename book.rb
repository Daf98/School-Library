require './rental'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
  attr_accessor :title, :author, :rentals

  # Create the has-many side of Book and Rental (a book has many rentals).
  def add_rentals(rental)
    @rentals.push(rental)
    rental.book = self
  end

  # Serialize Foo object with its class name and arguments
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [title, author]
    }.to_json(*args)
  end

  # Deserialize JSON string by constructing new Foo object with arguments.
  def self.json_create(object)
    new(*object['a'])
  end
end
