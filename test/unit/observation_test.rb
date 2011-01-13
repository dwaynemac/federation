require 'test_helper'

class ObservationTest < ActiveSupport::TestCase

  context "Observation" do
    should belong_to(:observer)
    should belong_to(:observed)

    should validate_presence_of(:observed)
    should validate_presence_of(:observer)
    should validate_presence_of(:observation)
    should validate_presence_of(:observed_on)

  end

end
