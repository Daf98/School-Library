module ListBooks
  def list_books
    puts 'List of books:'
    @books.each_with_index do |book, _index|
      puts "Title: '#{book.title}', Author: #{book.author}"
    end
  end
end
