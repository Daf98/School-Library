require_relative '../rental'

describe Rental do
  context 'with valid input' do
    before(:each) do
      @book = Book.new('IT', 'Stephen King')
      @person = Person.new(24, 'Daf')
      @new_rental = Rental.new(@book, @person, '2020/02/02')
    end
    context 'with valid input' do
      it 'should return a correct book title' do
        expect(@new_rental.book.title).to eq('IT')
      end

      it 'should return a correct person' do
        expect(@new_rental.person.name).to eq('Daf')
      end

      it 'should return a correct date' do
        expect(@new_rental.date).to eq('2020/02/02')
      end
    end
  end
end
