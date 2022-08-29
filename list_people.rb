module ListPeople
  def list_people
    puts 'List of people:'
    @people.each_with_index do |person, _i|
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
end
