FactoryGirl.define do
  factory :notification do
    sender_id 1
receiver_id 1
message "MyString"
seen false
  end

end
