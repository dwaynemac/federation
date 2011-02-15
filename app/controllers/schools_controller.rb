class SchoolsController < ApplicationController

  before_filter :set_scope

  def index
    @schools = @scope.all
    respond_to do |format|
      format.html
    end
  end

  private

  def set_scope
    if params[:federation_id]
      @scope = Federation.find(params[:federation_id]).schools
    else
      @scope = School
    end
  end

end
