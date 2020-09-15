FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
      nickname               {Faker::Name.initials(number: 2)}
      email                  {Faker::Internet.free_email}
      password               {Faker::Internet.password(min_length: 6, mix_case: true)}
      password_confirmation  {password}
      kanji_family_name      { person.last.kanji }
      kanji_first_name       { person.first.kanji }
      kana_family_name       { person.last.katakana }
      kana_first_name        { person.first.katakana }
      birthday               {Faker::Date.birthday(min_age: 18, max_age: 65)}

    
  end
end