class SchoolsController < ApplicationController

  before_filter :set_scope

  def index

    # for form
    @filiation_categories= FiliationCategory.all.map { |fc| [fc.name, fc.id] }
    @search= @scope.search(params[:search]||{:filiation_category_id_in => [2,3]})

    respond_to do |format|
      format.html do
        @schools = @search.all
        @totals = {:students => 0, :iniciantes => 0, :swasthya => 0, :sadhakas => 0, :yogins => 0, :chelas => 0, :in_formation => 0}
        @schools.each do |s|
          [:students, :iniciantes, :swasthya, :sadhakas, :yogins, :chelas, :in_formation].each do |key|
            @totals[key] += s.send("#{key}_count") unless s.send("#{key}_count").nil?
          end
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

  def destroy
    @scope.find(params[:id]).destroy
    redirect_to root_url
  end

  private

  def set_scope
    if params[:federation_id]
      @federation = Federation.find(params[:federation_id])
      @scope = @federation.schools
    else
      @scope = School.accessible_by(current_ability)
    end
  end

end
