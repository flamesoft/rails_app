FactoryGirl.define do
  factory :user1, class: User do
     name "Jenny"
     email  "jenny@gmail.com"
     password "password"
  end

  factory :user2, class: User do
     name "Daniel"
     email  "daniel@gmail.com"
     password "password"
  end
end
