require 'test_helper'

class SchoolsControllerTest < ActionController::TestCase
  context "get :index" do
    should respond_with(:success)
    should assign_to(:search)
    should assign_to(:schools)
    should render_template(:index)
  end

  context "get :new" do
    should respond_with(:success)
    should assign_to(:school)
    should render_template(:new)
    should assign_to(:filiation_categories)
  end
end
