require "rails_helper"

RSpec.describe User, type: :model do
  it "validates presence of username and email" do
    user = create(:user)
    expect(user.valid?).to eq(true)
  end
end
