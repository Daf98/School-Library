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
      File.write('./rentals.json', "#{json_rental}\n", mode: 'a')
    end
  end

  # Retrieve data
  def retrieve_rentals
    # if the JSON file is empty, start 'write' mode
    File.open('./rentals.json', 'w') unless File.exist?('./rentals.json')
    # if the JSON file is not empty, keep 'append' mode
    # emptying rental array
    @rentals = []
    # add rentals from JSON to rental array
    File.foreach('./rentals.json') do |line|
      rental = JSON.parse(line)
      person = list_people.select { |p| p.name == rental[0] }
      books = list_books.select { |b| b.title == rental[1] }
      @rentals << create_new_rental(person[0], books[0], rental[2])
    end
  end
end
