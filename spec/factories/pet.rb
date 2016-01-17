require 'faker'

FactoryGirl.define do
  factory :pet do |f|
    f.name { Faker::Name.first_name }
    f.age { Faker::Number.number(1) }
    f.breed { Faker::Name.last_name }
    f.photo { File.new(Rails.root.join('spec', 'fixtures', 'bat.jpg')) }
  end
end
