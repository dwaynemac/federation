require 'test_helper'

class FiliationCategoryTest < ActiveSupport::TestCase

  context "FiliationCategory" do
    should have_many(:schools)
  end
  
end
