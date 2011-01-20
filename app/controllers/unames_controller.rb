class UnamesController < ApplicationController

  before_filter :login_required

  def show
    object = Uname.get(params[:name])
    if object
      respond_to do |format|
        format.html { redirect_to object }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_url, :flash => { :error => t('unames.show.not_found')} }
      end
    end
  end

end
