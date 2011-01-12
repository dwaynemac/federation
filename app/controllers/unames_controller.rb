class UnamesController < ApplicationController

  def show
    object = Uname.get(params[:id])
    respond_to do |format|
      format.html { redirect_to object }
    end
  end

end
