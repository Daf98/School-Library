module PreservePeople
def save_people
    # emtpy JSON file
    File.write('./people.json', '', mode: 'w')
    # for each book in array, generate a JSON object with it
    # and append it to the JSON file into a new line
    list_people.each do |person|
      json_person = JSON.generate(person)
      File.write('./people.json', "#{json_person}\n", mode: 'a')
    end
  end

  # Retrieve data
  def retrieve_people
    # if the JSON file is empty, start 'write' mode
    File.open('./people.json', 'w') unless File.exist?('./people.json')
    # if the JSON file is not empty, keep 'append' mode
    # emptying book array
    @people = []
    # add books from JSON to book array
    File.foreach('./people.json') do |line|
      @people << JSON.parse(line, create_additions: true)
    end
    # return book array
    @people
  end
end