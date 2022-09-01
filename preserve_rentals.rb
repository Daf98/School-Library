module PreserveRentals
  def save_rentals
    # emtpy JSON file
    File.write('./rentals.json', '', mode: 'a')
    # for each book in array, generate a JSON object with it
    # and append it to the JSON file into a new line
    @rentals.each do |rental|
      array_rental = [rental.person.name, rental.book.title, rental.date]
      json_rental = JSON.generate(array_rental)
      File.write('./rentals.json', "#{json_rental}\n", mode: 'a')
    end
  end

  # Retrieve data
  def retrieve_rentals
    File.open('./rentals.json', 'w') unless File.exist?('./rentals.json')
    @parsed_rentals = []
    File.foreach('./rentals.json') do |line|
      @parsed_rentals << JSON.parse(line, create_additions: true)
    end
    @parsed_rentals.each do |rental|
      puts 'THIS IS PARSED RENTALS'
      puts rental[0]
    end
    @parsed_rentals
  end
end
