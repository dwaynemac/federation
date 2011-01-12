require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  context "School" do

    should belong_to(:federation)
    should have_one(:uname)
    should validate_presence_of(:name)

    should have_one(:director)
    should have_many(:team_members)

    should belong_to(:filiation_category)
  end
end
