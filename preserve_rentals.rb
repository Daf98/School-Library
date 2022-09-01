<<<<<<< HEAD
module PreserveRentals
  def save_rentals
    File.write('./rentals.json', '', mode: 'a')
    @rentals.each do |rental|
      array_rental = [rental.person.name, rental.book.title, rental.date]
      json_rental = JSON.generate(array_rental)
=======
require './app'
require 'json'

module PreserveRentals
  def save_rentals
    # emtpy JSON file
    File.write('./rentals.json', '', mode: 'w')
    # for each rental in array, generate a JSON object with it
    # and append it to the JSON file into a new line
    @rentals.each do |rental|
      json_rental = JSON.generate(rental)
>>>>>>> 4b98fbf06b3718d166e20f28d271b004d6a98eef
      File.write('./rentals.json', "#{json_rental}\n", mode: 'a')
    end
  end

  # Retrieve data
  def retrieve_rentals
<<<<<<< HEAD
    File.open('./rentals.json', 'w') unless File.exist?('./rentals.json')
    @parsed_rentals = []
    File.foreach('./rentals.json') do |line|
      @parsed_rentals << JSON.parse(line, create_additions: true)
    end
    @parsed_rentals
=======
    # if the JSON file is empty, start 'write' mode
    unless File.exist?('./rentals.json') 
      File.open('./rentals.json', 'w')
      return []
    end
    # if the JSON file is not empty, keep 'append' mode
    # emptying rental array
    @rentals = []
    # add rentals from JSON to rental array
    File.foreach('./rentals.json') do |line|
      rental = JSON.parse(line)
      person = list_people.select { |p| p.name == rental[0] }
      books = list_books.select { |b| b.title == rental[1] }
      rentals << create_new_rental(person[0], books[0], rental[2])
    end
    @rentals
>>>>>>> 4b98fbf06b3718d166e20f28d271b004d6a98eef
  end
end
