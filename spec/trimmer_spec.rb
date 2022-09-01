require_relative '../trimmer'

describe TrimmerDecorator do
  context 'with valid input' do
    it "should trim the person's name" do
      person = Person.new(22, 'maximilianus')
      trimmed_person = TrimmerDecorator.new(person)
      expect(trimmed_person.correct_name).to eq('maximilian')
    end
  end
end
