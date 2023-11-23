require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save a valid user' do
      @user = User.new(name: 'Test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      expect(@user).to be_valid
    end
    it 'should not save without a name' do
      @user = User.new(name: nil, email: 'test@test.com', password: 'test', password_confirmation: 'test')
      expect(@user).to_not be_valid
    end
    it 'should not save without an email' do
      @user = User.new(name: 'Test', email: nil, password: 'test', password_confirmation: 'test')
      expect(@user).to_not be_valid
    end
    it 'should not save without a password' do
      @user = User.new(name: 'Test', email: 'test@test.com', password: nil, password_confirmation: 'test')
      expect(@user).to_not be_valid
    end
    it 'should not save without a password confirmation' do
      @user = User.new(name: 'Test', email: 'test@test.com', password: 'test', password_confirmation: nil)
      expect(@user).to_not be_valid
    end
    it 'should not save if password and password confirmation do not match' do
      @user = User.new(name: 'Test', email: 'test@test.com', password: 'test', password_confirmation: 'test1')
      expect(@user).to_not be_valid
    end
    it 'should not save if email is not unique' do
      @user = User.new(name: 'Test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      @user.save
      @user2 = User.new(name: 'Test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      expect(@user2).to_not be_valid
    end
    it 'should not save if password is less than 4 characters' do
      @user = User.new(name: 'Test', email: 'test@test.com', password: 'tes', password_confirmation: 'tes')
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return a user if credentials are valid' do
      @user = User.new(name: 'Test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      @user.save
      expect(User.authenticate_with_credentials('test@test.com', 'test')).to eq(@user)
    end
    it 'should return nil if credentials are invalid' do
      @user = User.new(name: 'Test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      @user.save
      expect(User.authenticate_with_credentials('t@test.com', 'test')).to eq(nil)
    end
    it 'should return a user if credentials are valid with spaces around email' do
      @user = User.new(name: 'Test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      @user.save
      expect(User.authenticate_with_credentials(' test@test.com ', 'test')).to eq(@user)
    end
    it 'should return a user if credentials are valid with wrong case in email' do
      @user = User.new(name: 'Test', email: 'TeSt@tEsT.COM', password: 'test', password_confirmation: 'test')
      @user.save
      expect(User.authenticate_with_credentials('test@TEST.com', 'test')).to eq(@user)
    end
  end

end
