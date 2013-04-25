class UsersController < ApplicationController
  
  load_and_authorize_resource
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    if !current_user
      flash[:error] = "Access Denied."
      redirect_to root_url
    else

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    if !current_user
      flash[:error] = "Access Denied."
      redirect_to root_url
    else

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit

  end

  # POST /users
  # POST /users.json
  def create
    

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Registration Complete!' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = current_user
    params[:user][:role_ids] ||= []

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Profile was updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = current_user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
