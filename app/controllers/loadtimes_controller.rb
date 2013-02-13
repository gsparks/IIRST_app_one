class LoadtimesController < ApplicationController
  # GET /loadtimes
  # GET /loadtimes.xml
  def index
    @loadtimes = Loadtime.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @loadtimes }
    end
  end

  # GET /loadtimes/1
  # GET /loadtimes/1.xml
  def show
    @loadtime = Loadtime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @loadtime }
    end
  end

  # GET /loadtimes/new
  # GET /loadtimes/new.xml
  def new
    @loadtime = Loadtime.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loadtime }
    end
  end

  # GET /loadtimes/1/edit
  def edit
    @loadtime = Loadtime.find(params[:id])
  end

  # POST /loadtimes
  # POST /loadtimes.xml
  def create
    @loadtime = Loadtime.new(params[:loadtime])

    respond_to do |format|
      if @loadtime.save
        format.html { redirect_to(@loadtime, :notice => 'Loadtime was successfully created.') }
        format.xml  { render :xml => @loadtime, :status => :created, :location => @loadtime }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loadtime.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loadtimes/1
  # PUT /loadtimes/1.xml
  def update
    @loadtime = Loadtime.find(params[:id])

    respond_to do |format|
      if @loadtime.update_attributes(params[:loadtime])
        format.html { redirect_to(@loadtime, :notice => 'Loadtime was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @loadtime.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loadtimes/1
  # DELETE /loadtimes/1.xml
  def destroy
    @loadtime = Loadtime.find(params[:id])
    @loadtime.destroy

    respond_to do |format|
      format.html { redirect_to(loadtimes_url) }
      format.xml  { head :ok }
    end
  end
end
