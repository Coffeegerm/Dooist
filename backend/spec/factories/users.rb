FactoryBot.define do
  factory :user do
    username { "Username" }
    email { "Email" }
    password_digest { "Password_Digest" }
  end
end
