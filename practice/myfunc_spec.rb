require './myfunc.rb'

describe 'about test target' do
  context 'about context' do
    before(:all) do
    end

    before(:each) do
    end

    it 'about test1' do
      3.should == mysum(1,2)
    end

    it 'about test2-1' do
      [1,2,3].length.should == 3
    end

    it 'about test2-2' do
      [1,2,3].should have(3).items
    end

    #it 'pending test'

    after(:each) do
    end

    after(:all) do
    end

  end
end

#more readable
#describe [1,2,3].length do
#  it { should be_odd }
#end
