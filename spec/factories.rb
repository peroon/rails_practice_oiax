=begin
FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name  'Doe'
    age        { 1 + rand(100) }
        
    # Child of :user factory, since it's in the `factory :user` block
    factory :admin do
      admin true
    end
  end
end
=end

FactoryGirl.define do
  factory :member do
    sequence(:number){|n| n+1}
    sequence(:name){|n| "Taro#{n}"}
    full_name "Yamada Taro"
    sequence(:email){|n| "taro#{n}@example.com"}
    birthday 30.years.ago
  end
end
