require 'test_helper'

class PeopleControllerTest < ActionController::TestCase

  context "index" do
    setup { get :index }
    should respond_with(:success)
    should assign_to(:people)
    should assign_to(:search)
  end

  context "show" do
    setup { get :show, :id => Person.make.id }
    should respond_with(:success)
    should assign_to(:person)
  end

  context "new" do
    setup { get :new }
    should respond_with(:success)
    should assign_to(:person)
  end

  context "create" do
    context "un-scoped" do
      setup { post :create, :person => Person.plan }
      should respond_with(:redirect)
      should_change("person.count", :by => 1){Person.count}
    end
    context "scoped to school" do
      setup do
        @school = School.make
        post :create, :person => Person.plan, :school_id => @school.id
      end
      should respond_with(:redirect)
      should_change("person.count", :by => 1){Person.count}
      should_change("school.team_members.count", :by => 1){@school.team_members.count}
    end
  end

end
