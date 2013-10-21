#require 'test_helper'
#require 'rspec_factory_girl'
require 'spec_helper'

class MemberTest < ActiveSupport::TestCase
  test "the truth" do
    p 'i am model test'
    assert true
  end

  test "factory girl" do
    p 'factory'
    member = Factory(:member)
    assert_equal "Yamada Taro", member.full_name
  end
end
