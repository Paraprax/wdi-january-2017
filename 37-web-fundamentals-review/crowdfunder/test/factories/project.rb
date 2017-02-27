FactoryGirl.define do
  factory :project do
    title "test"
    description "test"
    goal 1
    start_date DateTime.now
    end_date DateTime.now
  end
end
