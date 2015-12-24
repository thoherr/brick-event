# -*- encoding: utf-8 -*-
class AttendancesController < ApplicationController
  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.where(:user_id => current_user.id).order('id desc')
    @past_attendances = @attendances.select { |att| !att.event.start_date.nil? and att.event.start_date <= Date.today }
    @future_attendances = @attendances.select { |att| att.event.start_date.nil? or att.event.start_date > Date.today }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @attendances }
    end
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @attendance }
    end
  end

  # GET /attendances/new
  # GET /attendances/new.json
  def new
    @attendance = Attendance.new
    @attendance.user_id = params[:user_id] unless params[:user_id].nil?
    @attendance.event_id = params[:event_id] unless params[:event_id].nil?

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @attendance }
    end
  end

  # GET /attendances/1/edit
  def edit
    @attendance = Attendance.find(params[:id])
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(params[:attendance])

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance }
        format.json { render :json => @attendance, :status => :created, :location => @attendance }
      else
        format.html { render :action => "new" }
        format.json { render :json => @attendance.errors, :status => :unprocessable_entity }
      end
    end
  end

  def approve
    @attendance = Attendance.find(params[:id])
    if @attendance
      @attendance.is_approved=!@attendance.is_approved
      respond_to do |format|
        if @attendance.save
          format.html { redirect_to @attendance.event, :notice => 'Anmeldebestätigung geändert.' }
          format.json { render :json => @attendance.event, :status => :updated, :location => @event }
        else
          format.html { render :action => "show" }
          format.json { render :json => @attendance.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # POST /attendances/copy_exhibits/:other_attendance_id
  def copy_exhibits
    @attendance = Attendance.find(params[:id])
    @other_attendance = Attendance.find(params[:other_attendance_id])

    respond_to do |format|
      if @attendance.copy_exhibits! @other_attendance
        format.html { redirect_to attendances_url, :notice => 'Einträge wurden kopiert.' }
        format.json { head :ok }
      else
        format.html { render :action => "show" }
        format.json { render :json => @attendance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # POST /attendances/add_former_exhibit/:former_exhibit_id
  def add_former_exhibit
    @attendance = Attendance.find(params[:id])
    # TODO
    @former_exhibit = Exhibit.find(params[:former_exhibit_id])
    respond_to do |format|
      if @attendance.add_former_exhibit! @former_exhibit
        format.html { redirect_to attendances_url, :notice => 'Eintrag wurde kopiert.' }
        format.json { head :ok }
      else
        format.html { render :action => "show" }
        format.json { render :json => @attendance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /attendances/former_exhibits
  def former_exhibits
    @attendance = Attendance.find(params[:id])
    # TODO
    # @former_exhibits =
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @attendance }
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    @attendance = Attendance.find(params[:id])

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        format.html { redirect_to @attendance, :notice => 'Attendance was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @attendance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to attendances_url }
      format.json { head :ok }
    end
  end
end
