class SchoolsController < ApplicationController

  before_filter :set_scope

  def index

    # for form
    @filiation_categories= FiliationCategory.all.map { |fc| [fc.name, fc.id] }
    @search= @scope.search(params[:search])

    respond_to do |format|
      format.html do
        @schools = @search.all
        @totals = {:students => 0, :iniciantes => 0, :swasthya => 0}
        @schools.each do |s|
          @totals[:swasthya]   += s.swasthya_count unless s.swasthya_count.nil?
          @totals[:iniciantes] += s.iniciantes_count unless s.iniciantes_count.nil?
          @totals[:students]   += s.students_count unless s.students_count.nil?
        end
      end
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
