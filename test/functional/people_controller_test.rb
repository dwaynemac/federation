require 'test_helper'

class PeopleControllerTest < ActionController::TestCase

  context "show" do
    setup { get :show, :id => Person.make.id }
    should respond_with(:success)
    should assign_to(:person)
  end

end
