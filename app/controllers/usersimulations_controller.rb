class UsersimulationsController < ApplicationController
  # GET /usersimulations
  # GET /usersimulations.xml
  def index
    @usersimulations = Usersimulation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usersimulations }
    end
  end

  # GET /usersimulations/1
  # GET /usersimulations/1.xml
  def show
    @usersimulation = Usersimulation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @usersimulation }
    end
  end

  # GET /usersimulations/new
  # GET /usersimulations/new.xml
  def new
    @usersimulation = Usersimulation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @usersimulation }
    end
  end

  # GET /usersimulations/1/edit
  def edit
    @usersimulation = Usersimulation.find(params[:id])
  end

  # POST /usersimulations
  # POST /usersimulations.xml
  def create
    @usersimulation = Usersimulation.new(params[:usersimulation])

    respond_to do |format|
      if @usersimulation.save
        format.html { redirect_to(@usersimulation, :notice => 'Usersimulation was successfully created.') }
        format.xml  { render :xml => @usersimulation, :status => :created, :location => @usersimulation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usersimulation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /usersimulations/1
  # PUT /usersimulations/1.xml
  def update
    @usersimulation = Usersimulation.find(params[:id])

    respond_to do |format|
      if @usersimulation.update_attributes(params[:usersimulation])
        format.html { redirect_to(@usersimulation, :notice => 'Usersimulation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usersimulation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usersimulations/1
  # DELETE /usersimulations/1.xml
  def destroy
    @usersimulation = Usersimulation.find(params[:id])
    @usersimulation.destroy

    respond_to do |format|
      format.html { redirect_to(usersimulations_url) }
      format.xml  { head :ok }
    end
  end
end
