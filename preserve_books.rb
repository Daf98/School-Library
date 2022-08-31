module PreserveBooks
    # Save data
  def save_books
    # emtpy JSON file
    File.write('./books.json', '', mode: 'w')
    # for each book in array, generate a JSON object with it
    # and append it to the JSON file into a new line
    list_books.each do |book|
      json_book = JSON.generate(book)
      File.write('./books.json', "#{json_book}\n", mode: 'a')
    end
  end

  # Retrieve data
  def retrieve_books
    # if the JSON file is empty, start 'write' mode
    File.open('./books.json', 'w') unless File.exist?('./books.json')
    # if the JSON file is not empty, keep 'append' mode
    # emptying book array
    @books = []
    # add books from JSON to book array
    File.foreach('./books.json') do |line|
      @books << JSON.parse(line, create_additions: true)
    end
    # return book array
    @books
  end
end