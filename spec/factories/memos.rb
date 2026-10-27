FactoryBot.define do
  factory :memo do
    factory :memo1 do
      association :category, factory: :c_todo
      content { "Python Report, by Oct. 29" }
    end

    factory :memo1_wrong, parent: :memo1 do
      category_id { nil }
    end

    factory :memo1_new, parent: :memo1 do
      content { "Python Report, by Nov. 5" }
    end

    factory :memo2 do
      association :category, factory: :c_idea
      content { "Try Crystal Tutorial" }
    end
  end
end