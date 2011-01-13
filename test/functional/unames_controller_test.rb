require 'test_helper'

class UnamesControllerTest < ActionController::TestCase

  context "unames#show" do
    context "with invalid uname" do
      setup { get :show, :name => "asdf" }
    end


    should "redirect to named_object#show"
  end

end
