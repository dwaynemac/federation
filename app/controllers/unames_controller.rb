class UnamesController < ApplicationController
  # GET /unames
  # GET /unames.xml
  def index
    @unames = Uname.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @unames }
    end
  end

  # GET /unames/1
  # GET /unames/1.xml
  def show
    @uname = Uname.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @uname }
    end
  end

  # GET /unames/new
  # GET /unames/new.xml
  def new
    @uname = Uname.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @uname }
    end
  end

  # GET /unames/1/edit
  def edit
    @uname = Uname.find(params[:id])
  end

  # POST /unames
  # POST /unames.xml
  def create
    @uname = Uname.new(params[:uname])

    respond_to do |format|
      if @uname.save
        format.html { redirect_to(@uname, :notice => 'Uname was successfully created.') }
        format.xml  { render :xml => @uname, :status => :created, :location => @uname }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @uname.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /unames/1
  # PUT /unames/1.xml
  def update
    @uname = Uname.find(params[:id])

    respond_to do |format|
      if @uname.update_attributes(params[:uname])
        format.html { redirect_to(@uname, :notice => 'Uname was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @uname.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /unames/1
  # DELETE /unames/1.xml
  def destroy
    @uname = Uname.find(params[:id])
    @uname.destroy

    respond_to do |format|
      format.html { redirect_to(unames_url) }
      format.xml  { head :ok }
    end
  end
end
