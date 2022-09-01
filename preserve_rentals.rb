module PreserveRentals
  def save_rentals
    File.write('./rentals.json', '', mode: 'a')
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
    @parsed_rentals
  end
end
