require 'test_helper'

class FederationTest < ActiveSupport::TestCase

  context "Federation" do

    should have_many(:schools)
    should validate_presence_of(:name)
    should have_one(:uname)

    should belong_to(:president)
    should belong_to(:vice_president)

  end

end
