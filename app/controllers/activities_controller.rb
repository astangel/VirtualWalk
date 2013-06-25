class ActivitiesController < ApplicationController
  # GET /activities
  # GET /activities.json
  def index
    if !current_user
      flash[:error] = "Access Denied."
      redirect_to root_url
    else
      if (can? :manage, :all)
        @activities = Activity.all
      else
        @activities = Activity.where(:user_id => current_user.id)
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @activities }
        end
      end
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity = Activity.find(params[:id])
    if !current_user
      flash[:error] = "Access Denied."
      redirect_to root_url
    else
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
    end
  end

  # GET /activities/new
  # GET /activities/new.json
  def new
    @activity = Activity.new
    if !current_user
      flash[:error] = "Access Denied."
      redirect_to root_url
    else
      
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @activity }
      end
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(params[:activity])
    @activity.manual = true
    @activity.user = current_user

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render json: @activity, status: :created, location: @activity }
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    @activity = Activity.find(params[:id])
    @activity.manual = true

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :no_content }
    end
  end
end
