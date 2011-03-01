class PeopleController < ApplicationController

  before_filter :set_scope

  def index

    @schools = current_user.federation.schools.all

    if params[:search].nil?
      # default filter
      params[:search] = {:active_is_true => true, :uniyoga_is_true => true}
    end
    @search = @scope.search(params[:search])

    respond_to do |format|
      format.html { @people = @search.paginate :page => params[:page] }
    end
  end

  def show
    @person = @scope.find(params[:id], :include => :observations)
    respond_to do |format|
      format.html
    end
  end

  def new
    @person = @scope.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @person = @scope.new(params[:person])
    if @person.save
      respond_to do |format|
        format.html { redirect_to people_url, :flash => { :success => t('people.create.success')} }
      end
    else
      respond_to do |format|
        format.html { render :action => :new }
      end
    end
  end

  def edit
    @person = @scope.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def update
    @person = @scope.find(params[:id])
    if @person.update_attributes(params[:person])
      respond_to do |format|
        format.html { redirect_to people_url, :flash => {:success => t('people.update.success')} }
      end
    else
      respond_to do |format|
        format.html { render :action => :edit }
      end
    end
  end

  def destroy
    @person = @scope.find(params[:id])
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_path }
    end
  end

  private

  def set_scope
    if params[:school_id]
      @scope = School.find(params[:school_id]).team_members.accessible_by(current_ability)
    else
      @scope = current_user.federation.people.accessible_by(current_ability)
    end
  end

end
