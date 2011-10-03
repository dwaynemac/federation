class FederationsController < ApplicationController

  before_filter :set_scope

  def index
    @federations = @scope.all
  end

  def new
    @federation = Federation.new
  end

  def create
    @federation = Federation.new(params[:federation])
    if @federation.save
      redirect_to federation_schools_path(:federation_id => @federation.id)
    else
      render :action => :new
    end
  end

  private

  def set_scope
    @scope = Federation.accessible_by(current_ability)
  end
end
