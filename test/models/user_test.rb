require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'valid user' do
    user = User.new(email: 'a@b.com', password: 'password')
    assert user.valid?
  end

  test 'invalid without email' do
    user = User.new(password: 'John')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

  test 'invalid without password' do
    user = User.new(email: 'a@b.com')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

end
