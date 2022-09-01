require_relative '../person'

describe Person do
  context 'with valid input' do
    before(:each) do
      @new_person = Person.new(24, 'Daf')
    end
    context 'with valid input' do
      it 'should return a correct age' do
        expect(@new_person.age).to eq(24)
      end
      it 'should return a correct name' do
        expect(@new_person.name).to eq('Daf')
      end
      it 'should return a correct correct_name' do
        expect(@new_person.correct_name).to eq('Daf')
      end
      it 'should return services as true' do
        expect(@new_person.can_use_services?).to be_truthy
      end
      it "should return 'of_age?' as true" do
        expect(@new_person.of_age?).to be_truthy
      end
      # it 'should create a rental' do
      #   new_book = Book.new('IT', 'Stephen King')
      #   new_rental = Rental.new(new_book, @new_person, '2020/02/02')
      #   @new_person.add_rentals(new_rental)
      #   expect(@new_person.rentals.length).to be(1)
      #   expect(@new_person.name).to be('Daf')
      #   expect(new_book.rentals.length).to be(1)
      # end
    end
  end
end

describe Person do
  context 'with valid input' do
    before(:each) do
      @new_person = Person.new(16)
    end
    context 'with valid input' do
      it 'should return a correct age' do
        expect(@new_person.age).to eq(16)
      end

      it "should return 'Unknown' as name" do
        expect(@new_person.name).to eq('Unknown')
      end
      it 'should return services as false' do
        expect(@new_person.can_use_services?).to be_falsey
      end
      it "should return 'of_age?' as false" do
        expect(@new_person.of_age?).to be_falsey
      end
    end
  end
end
