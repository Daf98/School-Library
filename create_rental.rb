module CreateRental
  # 5 - Create a rental
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/PerceivedComplexity
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/AbcSize
  def create_rental
    if @books.length.positive? && @people.length.positive?
      puts 'Select a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index + 1} - #{book.title} by #{book.author}" }
      book_index = gets.chomp
      unless book_index.to_i.positive? && book_index.to_i <= @books.length
        puts 'Invalid book number, please try again'
        create_rental
      end
      puts 'Select a person from the following list by number (not id)'
      @people.each_with_index { |person, i| puts "#{i + 1}) #{person.name}, ID: #{person.id}, Age: #{person.age}" }
      person_index = gets.chomp
      unless person_index.to_i.positive? && person_index.to_i <= @people.length
        puts 'Invalid person number, please try again'
        create_rental
      end
      print 'Date: '
      date = gets.chomp
      new_rental = Rental.new(books[book_index.to_i - 1], people[person_index.to_i - 1], date)
      @rentals.push(new_rental)
      @parsed_rentals.push([@people[person_index.to_i - 1].name, @books[book_index.to_i - 1].title, date])
      puts 'Rental created successfully'
    else
      puts 'No books/people found'
    end
  end

  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/AbcSize
end
