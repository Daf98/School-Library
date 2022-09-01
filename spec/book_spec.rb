require_relative '../book'

describe Book do
  context 'with valid input' do
    before(:each) do
      @new_book = Book.new('Ringu', 'Koji Suzuki')
    end
    context 'with valid input' do
      it 'should return a correct book title' do
        expect(@new_book.title).to eq('Ringu')
      end

      it 'should return a correct book author' do
        expect(@new_book.author).to eq('Koji Suzuki')
      end
    end
  end
end
