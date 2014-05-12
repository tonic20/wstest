FactoryGirl.define do
  factory :app_config do
    name       { Faker::Lorem.word }
    value      { Faker::Lorem.word }
    value_type { :string }

    factory :app_config_integer do
      value      { rand(1000).to_s }
      value_type { :integer }
    end

    factory :app_config_float do
      value      { rand.to_s }
      value_type { :float }
    end

    factory :app_config_boolean do
      value      { (rand > 0.5).to_s }
      value_type { :boolean }
    end
  end
end