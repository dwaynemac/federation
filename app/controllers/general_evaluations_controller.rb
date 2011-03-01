class GeneralEvaluationsController < ApplicationController
  before_filter :set_scope

  def show
    @general_evaluation = @scope.find(params[:id])
  end

  def new
    @general_evaluation = @scope.new(:evaluated_on => Time.zone.today)
  end

  def create
    @general_evaluation = @scope.new(params[:general_evaluation])

    @general_evaluation.evaluator = current_user
    @general_evaluation.federation = current_user.federation
    @general_evaluation.evaluated = @person

    if @general_evaluation.save
      respond_to do |format|
        format.html { redirect_to @person, :flash => {:success => "General concept evaluation created"}}
      end
    else
      respond_to do |format|
        format.html { render :action => :new }
      end
    end
  end

  def edit
    @general_evaluation = @scope.find(params[:id])
  end

  def update
    @general_evaluation = @scope.find(params[:id])
    if @general_evaluation.update_attributes(params[:general_evaluation])
      respond_to do |format|
        format.html { redirect_to @person, :flash => {:success => "General concept evaluation updated"} }
      end
    else
      respond_to do |format|
        format.html { render :action => :edit }
      end
    end
  end

  def destroy
    @general_evaluation = @scope.find(params[:id])
    @general_evaluation.destroy
    redirect_to @person, :flash => { :success => "General evaluation deleted" }
  end

  private

  def set_scope
    @person = Person.accessible_by(current_ability).find(params[:person_id])
    @scope = @person.general_evaluations
  end
end
