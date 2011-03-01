class SchoolsController < ApplicationController

  before_filter :set_scope

  def index

    # for form
    @filiation_categories= FiliationCategory.all.map { |fc| [fc.name, fc.id] }

    @search= @scope.search(params[:search])

    respond_to do |format|
      format.html { @schools = @search.all }
    end
  end

  def new
    @school= @scope.new
  end

  def create
    @school= @scope.new(params[:school])
    if @school.save
      respond_to do |format|
        format.html { redirect_to schools_url, :flash => {:success => t('schools.create.success')} }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new'}
      end
    end
  end

  def edit
    @school= @scope.find(params[:id])
  end

  def update
    @school = @scope.find(params[:id])
    if @school.update_attributes(params[:school])
      respond_to do |format|
        format.html { redirect_to schools_url, :flash => {:success => t('schools.update.success')} }
      end
    else
      respond_to do |format|
        format.html { render :action => 'edit' }
      end
    end
  end

  private

  def set_scope
    if params[:federation_id]
      @scope = Federation.find(params[:federation_id]).schools
    else
      @scope = School.accessible_by(current_ability)
    end
  end

end
