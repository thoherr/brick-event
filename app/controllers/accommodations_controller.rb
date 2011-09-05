# encoding: UTF-8
class AccommodationsController < ApplicationController
  # GET /accommodations
  # GET /accommodations.json
  def index
    @accommodations = Accommodation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @accommodations }
    end
  end

  # GET /accommodations/1
  # GET /accommodations/1.json
  def show
    @accommodation = Accommodation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @accommodation }
    end
  end

  # GET /accommodations/new
  # GET /accommodations/new.json
  def new
    @accommodation = Accommodation.new
    @accommodation.attendance_id = params[:attendance_id] unless params[:attendance_id].nil?

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @accommodation }
    end
  end

  # GET /accommodations/1/edit
  def edit
    @accommodation = Accommodation.find(params[:id])
  end

  # POST /accommodations
  # POST /accommodations.json
  def create
    @accommodation = Accommodation.new(params[:accommodation])

    respond_to do |format|
      if @accommodation.save
        format.html { redirect_to @accommodation.attendance, :notice => 'Der Hotelwunsch wurde aufgenommen.'}
        format.json { render :json => @accommodation, :status => :created, :location => @accommodation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @accommodation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /accommodations/1
  # PUT /accommodations/1.json
  def update
    @accommodation = Accommodation.find(params[:id])

    respond_to do |format|
      if @accommodation.update_attributes(params[:accommodation])
        format.html { redirect_to @accommodation.attendance, :notice => 'Der Hotelwunsch wurde geändert.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @accommodation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /accommodations/1
  # DELETE /accommodations/1.json
  def destroy
    @accommodation = Accommodation.find(params[:id])
    @attendance_id = @accommodation.attendance_id
    @accommodation.destroy

    respond_to do |format|
      format.html { redirect_to attendance_path(@attendance_id), :notice => 'Der Hotelwunsch wurde gelöscht.' }
      format.json { head :ok }
    end
  end
end
