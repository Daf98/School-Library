require_relative '../classroom'

describe Classroom do
  context 'with valid input' do
    before(:each) do
      @new_classroom = Classroom.new('Physics')
    end
    context 'with valid input' do
      it 'should return a correct label' do
        expect(@new_classroom.label).to eq('Physics')
      end
    end
  end
end
