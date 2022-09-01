require_relative '../decorator'

describe Decorator do
  context 'with valid input' do
    before :each do
      @maximilianus = Person.new(22, 'maximilianus')
      @decorator = Decorator.new(@maximilianus)
    end

    it 'should return the name maximilianus' do
      expect(@decorator.correct_name).to eq 'maximilianus'
    end
  end
end
