FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
  end

  factory :food do
    sequence(:name) { |n| "Food #{n}" }
    sequence(:price) { |n| "32#{n}" }
    course "first"
  end
  factory :menu do
    sequence(:name) { |n| "Food #{n}" }
    sequence(:price) { |n| "32#{n}" }
    course "first"
  end

end