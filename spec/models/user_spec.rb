require 'spec_helper'

describe User do
  let(:valid_attributes) { { "email" => 'g.t@hp.com' ,"first_name" => "MyString", "last_name" => 'MyString',
                             'password' => 'foobar4059', 'password_confirmation' =>'foobar4059'} }
  context "Validations" do
    let(:user) {  User.new(valid_attributes)  }

    before do
      User.create(valid_attributes)
    end
    it "requires an email to be present" do
      expect(user).to validate_presence_of(:email)
    end

    it "requires an email to be unique" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires an email to be downcase version of entered input" do
      user.email = "EMAIL@EMAIL.com"
      expect(user.save).to be_true
      expect(user.email).to eq('email@email.com')
    end
  end
end
