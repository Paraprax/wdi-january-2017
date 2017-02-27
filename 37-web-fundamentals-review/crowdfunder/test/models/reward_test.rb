require 'test_helper'

class RewardTest < ActiveSupport::TestCase
  test "reward is valid with default factory" do
    reward = FactoryGirl.build(:reward)
    assert reward.valid?
  end
end
