require 'test_helper'

class ObservationsControllerTest < ActionController::TestCase

  context "new" do
    setup { get :new, :person_id => Person.make(:federation => @federation) }
    should respond_with(:success)
    should assign_to(:person)
    should assign_to(:scope)
    should assign_to(:observation)
    should "set observed_on to Time.zone.today" do
      assert_equal Time.zone.today, assigns(:observation).observed_on
    end
  end

  context "create" do
    context "with valid data" do
      setup do
        @person = Person.make(:federation => @federation)
        post :create, :person_id => @person.id, :observation => Observation.plan(:observed => nil, :observer => nil)
      end
      should respond_with(:redirect)
      should redirect_to(@person)
      should_change("Observation.count", :by => 1){Observation.count}
    end
  end

  context "destroy" do
    setup do
      @person = Person.make(:federation => @federation)
      delete :destroy, :person_id => @person.id, :observation_id => Observation.make(:observed => @person, :observer => @user).id
    end
    should redirect_to @person
    should_change( "Observation.count", :by => -1 ){Observation.count}
  end
end
