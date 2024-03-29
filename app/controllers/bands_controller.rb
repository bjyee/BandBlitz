class BandsController < ApplicationController
  # GET /bands
  # GET /bands.xml
  def index
    @bands = Band.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bands }
    end
  end

  # GET /bands/1
  # GET /bands/1.xml
  def show
    @band = Band.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @band }
    end
  end

  # GET /bands/new
  # GET /bands/new.xml
  def new
    authorize! :new, @band
    @band = Band.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @band }
    end
  end

  # GET /bands/1/edit
  def edit
    @band = Band.find(params[:id])
	authorize! :update, @band	
  end

  # POST /bands
  # POST /bands.xml
  def create
	authorize! :new, @band
  @band = Band.new(params[:band])
    respond_to do |format|
      if @band.save
        format.html { redirect_to(@band, :notice => 'Band was successfully created.') }
        format.xml  { render :xml => @band, :status => :created, :location => @band }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @band.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bands/1
  # PUT /bands/1.xml
  def update
    @band = Band.find(params[:id])
	authorize! :update, @band
    respond_to do |format|
      if @band.update_attributes(params[:band])
        format.html { redirect_to(@band, :notice => 'Band was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @band.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.xml
  def destroy
    @band = Band.find(params[:id])
    @band.destroy
	authorize! :destroy, @band
    respond_to do |format|
      format.html { redirect_to(bands_url) }
      format.xml  { head :ok }
    end
  end
end
