FactoryBot.define do
  factory :category do
    factory :c_todo do
      name { 'ToDo' }
    end

    factory :c_idea do
      name { 'Idea' }
    end
  end
end