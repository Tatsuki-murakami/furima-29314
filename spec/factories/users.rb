FactoryBot.define do
  factory :user do
    nickname                        {Faker::Name.initials(number: 2)}
    email                           {Faker::Internet.free_email}
    encrypted_password              {Faker::Internet.password(min_length: 6)}
    encrypted_password_confirmation {password}
    birthday                        {Faker::Date.birthday}
    family_name                     {Faker::Japanese::Name.last_name}
    name                            {Faker::Japanese::Name.first_name}
    family_name_furigana            {Faker::Japanese::Name.last_name}
    name_furigana                   {Faker::Japanese::Name.first_name}
  end
end
