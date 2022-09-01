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
    end
  end
end

describe Person do
  context 'with valid input' do
    before(:each) do
      @new_person = Person.new(24)
    end
    context 'with valid input' do
      it 'should return a correct age' do
        expect(@new_person.age).to eq(24)
      end

      it "should return 'Unknown' as name" do
        expect(@new_person.name).to eq('Unknown')
      end
    end
  end
end
