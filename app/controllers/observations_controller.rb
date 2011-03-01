class ObservationsController < ApplicationController

  before_filter :set_scope

  def new
    @observation = @scope.new(:observed_on => Time.zone.today)
  end

  def create
    @observation = @scope.new(params[:observation])
    @observation.observer = current_user

    # TODO this should not be necesary, observed_id should be automaticaly assigned by @scope.new, check whats wrong
    @observation.observed = @person

    if @observation.save!
      respond_to do |format|
        format.html { redirect_to person_url(@person), :flash => { :success => t('observation.create.success')} }
      end
    else
      respond_to do |format|
        format.html { render :action => :new }
      end
    end
  end

  def edit
    @observation = @scope.find(params[:id])
  end
  
  def update
    @observation = @scope.find(params[:id])
    if @observation.update_attributes(params[:observation])
      respond_to do |format|
        format.html { redirect_to @person, :flash => {:success => t('observation.update.success')} }
      end
    else
      respond_to do |format|
        format.html { render :action => 'edit'}
      end

    end
  end
  
  def destroy
    @observation = @scope.find(params[:id])
    @observation.destroy
    respond_to do |format|
      format.html { redirect_to person_url(@person), :flash => { :success => t('observation.destroy.success')}}
    end
  end
  private

  def set_scope
    @person = current_user.federation.people.accessible_by(current_ability).find(params[:person_id])
    @scope = @person.observations.accessible_by(current_ability)
  end

end
