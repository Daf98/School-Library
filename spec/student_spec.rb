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
      it 'should return a correct name' do
        expect(@new_student.parent_permission).to be(false)
      end
    end
  end
end

describe Student do
  context 'with valid input' do
    before(:each) do
      @new_student = Student.new(18, 'Robert', true)
    end
    context 'with valid input' do
      it 'should return a correct age' do
        expect(@new_student.age).to eq(18)
      end

      it 'should return a correct name' do
        expect(@new_student.name).to eq('Robert')
      end
      it 'should return a correct name' do
        expect(@new_student.parent_permission).to be(true)
      end
    end
  end
end
