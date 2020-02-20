require 'test_helper'

class UserTest < ActiveSupport::TestCase
    setup do
        @user = users(:one)
    end

    test "should fail if the user is not valid" do
        user1 = @user.dup
        assert_not user1.valid?
	end

    test "user should save" do
        assert User.new(username: "caroline", email: "carol@gmail.com").save(validate: false)
    end
end
