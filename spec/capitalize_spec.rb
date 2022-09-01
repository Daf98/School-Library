require_relative '../capitalize'

describe CapitalizeDecorator do
  context 'with valid input' do
    it "should capitalize the person's name" do
      person = Person.new(22, 'maximilianus')
      capitalized_person = CapitalizeDecorator.new(person)
      expect(capitalized_person.correct_name).to eq('Maximilianus')
    end
  end
end
