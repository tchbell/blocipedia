FactoryGirl.define do
  factory :wiki do
    title "MyString"
    body "This is the body for our test wiki"
    private false
    user nil
  end
end
