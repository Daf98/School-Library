require_relative '../student'

describe Student do
  context 'with valid input' do
    before(:each) do
      @new_student = Student.new(18, 'Robert')
    end
    context 'with valid input' do
      it 'should return a correct age' do
        expect(@new_student.age).to eq(18)
      end

      it 'should return a correct name' do
        expect(@new_student.name).to eq('Robert')
      end
    end
  end
end
