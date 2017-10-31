require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # subject(:user) { User.create(username: "user", password: "password") }
  subject(:user) {FactoryBot.create(:user)}

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_uniqueness_of(:username) }

  describe '.find_by_credentials' do
    let(:steve) { User.create(username: "steve", password: "password") }

    context 'when credentials are correct' do
      it 'should return user' do
        # new_steve = User.find_by_credentials("steve", "password")
        steve
        expect(User.find_by_credentials("steve", "password")).to eq(steve)
      end
    end

    context 'when credentials are incorrect' do
      it 'should return nil' do
        steve
        expect(User.find_by_credentials("steve", 'fasdfas')).to eq(nil)
      end
    end

  end

  describe '#password=' do
    it 'should set password_digest' do
      expect(user.password_digest).to_not be(nil)
    end
  end

  describe '#is_password?' do
    it 'should return true if valid password'do
      expect(user.is_password?("password")).to be(true)
    end

    it 'should return false if invalid password'do
      expect(user.is_password?("psdfgsdfgd")).to be(false)
    end
  end

end
