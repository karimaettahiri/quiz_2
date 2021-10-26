require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validates" do
    it("should require a first name") do
      user = User.new()
      user.valid?
      expect(user.errors.messages).to(have_key(:first_name))
    end

    it("should require a last name") do
      user = User.new()
      user.valid?
      expect(user.errors.messages).to(have_key(:last_name))
    end

    it("should require a email") do
      user = User.new()
      user.valid?
      expect(user.errors.messages).to(have_key(:email))
    end

    it("should have a unique email") do
      persisted_user =  FactoryBot.create(:user)
      user = User.new(email: persisted_user.email)
      user.valid?
      expect(user.errors.messages[:email]).to(include("has already been taken"))
    end
  end
  
end
