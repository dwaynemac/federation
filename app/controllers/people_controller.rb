class PeopleController < ApplicationController

  before_filter :set_scope

  def show
    @person = @scope.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  
  private
  def set_scope
    if params[:school_id]
      @scope = School.find(params[:school_id]).team_members
    elsif params[:federation_id]
      @scope = Federation.find(params[:federation_id]).people
    else
      @scope = Person
    end
  end

end
