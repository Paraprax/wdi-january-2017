require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "project is valid with default factory" do
    project = FactoryGirl.build(:project)
    assert project.valid?
  end
end
