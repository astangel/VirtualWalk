class TeamsController < ApplicationController
  # GET /teams
  # GET /teams.json
  def index
    if !current_user
      flash[:error] = "Access Denied."
      redirect_to root_url
    else
      if (can? :manage, :all)
        @teams = Team.all
      else
        @teams = Team.find_by_sql("Select Teams.* from Teams JOIN Registrations on (Teams.id = Registrations.team_id) where Registrations.user_id=5;")
        #.where(:users => current_user)
      end
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @teams }
      end
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])
    @activities = Activity.where("user_id = ?",@team.users)
    @act_totals = Activity.where("user_id = ?",@team.users).sum("distance")
    if !current_user
      flash[:error] = "Access Denied."
      redirect_to root_url
    else

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new
    if !current_user
      flash[:error] = "Access Denied."
      redirect_to root_url
    else

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end
end
