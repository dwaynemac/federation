require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  context "Person" do
    should belong_to(:federation)
    should belong_to(:school)
    should belong_to(:monitor)
    should belong_to(:supervisor)

    should have_one(:uname)

    should have_many(:monitored)
    should have_many(:supervised)

    should have_many(:observations)

    should allow_value('asistente').for(:level)
    should allow_value('docente').for(:level)
    should allow_value('maestro').for(:level)
    should_not allow_value('any other').for(:level)
    should validate_presence_of(:level)

    context "#full_name" do
      setup { @person = Person.make(:first_name => "Dwayne", :last_name => "Macgowan")}
      should "return Dwayne Macgowan" do
        assert_equal "Dwayne Macgowan", @person.full_name
      end
    end

  end

end
