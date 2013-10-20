require './myfunc.rb'

describe 'aaa' do
  context 'bbb' do
    before do
      a = 1
      p a
    end

    it 'ccc' do
      mysum(1,2) == 3
    end

    it 'ddd' do
      2 == 2
    end

    it 'ddd' do
      2 == 3
    end

  end
end
