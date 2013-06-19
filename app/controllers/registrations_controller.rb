class RegistrationsController < ApplicationController
  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all
    if !current_user
      flash[:error] = "Access Denied."
      redirect_to root_url
    else
    
    @userRegistrations = Registration.where(:user_id => current_user)  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registrations }
    end
    end
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    @registration = Registration.find(params[:id])
    @activities = Activity.where(:user_id => @registration.user_id)
    @act_totals = Activity.where(:user_id => @registration.user_id).sum("distance")
    if !current_user
      flash[:error] = "Access Denied."
      redirect_to root_url
    else
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration }
    end
    end
  end

  # GET /registrations/new
  # GET /registrations/new.json
  def new
    @registration = Registration.new
    if !current_user
      flash[:error] = "Access Denied."
      redirect_to root_url
    else
    #@registration.user_id = current_user
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registration }
    end
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(params[:registration])
    @registration.user = current_user

    respond_to do |format|
      if @registration.save
        format.html { redirect_to @registration, notice: 'Registration was successfully created.' }
        format.json { render json: @registration, status: :created, location: @registration }
      else
        format.html { render action: "new" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registrations/1
  # PUT /registrations/1.json
  def update
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to registrations_url }
      format.json { head :no_content }
    end
  end
end
