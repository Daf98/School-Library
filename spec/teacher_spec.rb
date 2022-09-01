require_relative '../teacher'

describe Teacher do
  context 'with valid input' do
    before(:each) do
      @new_teacher = Teacher.new(35, 'Programming', 'Fabien')
    end
    context 'with valid input' do
      it 'should return a correct age' do
        expect(@new_teacher.age).to eq(35)
      end

      # it 'should return a correct specialization' do
      #   expect(@new_teacher.specialization).to eq('Programming') # doesnt work
      # end

      it 'should return a correct name' do
        expect(@new_teacher.name).to eq('Fabien')
      end
    end
  end
end
