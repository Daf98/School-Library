require './person'
require './book'

class Rental
  attr_reader :book, :person, :date

  def initialize(book, person, date)
    @date = date
    @book = book
    @person = person
    book.rentals << self 
    person.rentals << self 
  end
<<<<<<< HEAD
=======

  # Serialize Foo object with its class name and arguments
  # def to_json(*args)
  #   {
  #     JSON.create_id => self.class.name,
  #     'rental' => [book, person, date]
  #   }.to_json(*args)
  # end

  # # Deserialize JSON string by constructing new Foo object with arguments.
  # def self.json_create(object)
  #   new(*object['rental'])
  # end
>>>>>>> 4b98fbf06b3718d166e20f28d271b004d6a98eef
end
