FactoryGirl.define do
  factory :task do
    description "description"
    completed false
    deadline DateTime.new
    position 1
    # project nil
  end
end
