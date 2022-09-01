module PreserveRentals
  def save_rentals
    # emtpy JSON file
    File.write('./rentals.json', '', mode: 'w')
    # for each book in array, generate a JSON object with it
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
    # emptying book array
    @rentals = []
    # add books from JSON to book array
    File.foreach('./rentals.json') do |line|
      @rentals << JSON.parse(line, create_additions: true)
    end
    # return book array
    @rentals
  end
end
