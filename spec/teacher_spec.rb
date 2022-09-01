require_relative '../teacher'

describe Teacher do
  context 'with valid input' do
    before(:each) do
      @new_teacher = Teacher.new(35, 'Programming', 'Fabien')
    end
    context 'with valid input' do
      it 'should return a correct age' do
        expect(@new_teacher.age).to eq(35)
        expect(@new_teacher.age).not_to eq(300)
      end
      it 'should return a correct name' do
        expect(@new_teacher.name).to eq('Fabien')
        expect(@new_teacher.name).not_to eq('Fabricio')
      end
      it 'should return services as true' do
        expect(@new_teacher.can_use_services?).to be_truthy
      end
    end
  end
end
