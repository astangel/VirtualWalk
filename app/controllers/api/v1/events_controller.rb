module Api
  module V1
    class EventsController < ApplicationController
      before_filter :restrict_access
      respond_to :json
      

      def index
        respond_with Event.all    
      end 
 
      def show
        selectedEvent = params[:id]
        if (selectedEvent == nil)
          respond_with null
        else
          respond_with Event.where('id in (?)', selectedEvent)
        end        
      end 
 
      def teams
        selectedEvent = params[:id]
        if (selectedEvent == nil)
          respond_with nil
        else
          if (Event.where('id in (?)', selectedEvent).count>0)
            respond_with Event.find(selectedEvent).teams
          else
            respond_with nil
          end
        end        
      end
      
      def progress
        selectedEvent = params[:id]
        unless selectedEvent
          respond with nil
        else
          if (Event.where('id in (?)', selectedEvent).count>0)
            #respond_with '[{"distance:"'+Activity.where(:event_id => params[:id]).sum("distance").to_s+'"}]'
            respond_with '[{"event_progress":"'+Event.find(selectedEvent).activities.sum("distance").to_s+'","event_goal":"'+Event.find(selectedEvent).goal.to_s+'"}]'
          else
            respond_with nil
          end
        end
      end
      
      def teams_progress
        selectedEvent = params[:id]
        unless selectedEvent
          respond with nil
        else
          if (Event.where('id in (?)', selectedEvent).count>0)
            #respond_with '[{"distance:"'+Activity.where(:event_id => params[:id]).sum("distance", :group => :teams).to_s+'"}]'
            respond_with Team.find_by_sql("SELECT teams.id AS team_id, sum(activities.distance) AS progress, teams.team_goal FROM teams INNER JOIN registrations ON teams.id=registrations.team_id LEFT JOIN activities ON registrations.user_id = activities.user_id WHERE teams.event_id=18 AND activities.event_id = 18 GROUP BY teams.id")
          else
            respond_with nil
          end
        end
      end
      
      def user_progress
        selectedEvent = params[:id]
        unless selectedEvent
          respond with nil
        else
          if (Event.where('id in (?)', selectedEvent).count>0)
            #respond_with '[{"distance:"'+Activity.where(:event_id => params[:id]).sum("distance", :group => :teams).to_s+'"}]'
            str = '[{"user_progress":"'+@user.activities.where(event_id: selectedEvent).sum("distance").to_s+'","user_goal":"'+@user.registrations.where(event_id: selectedEvent)[0].personal_goal.to_s+'"}]'
            #goal = @user.registrations.where(event_id: selectedEvent)[0].personal_goal
            #prog = @user.activities.where(event_id: selectedEvent).sum("distance")
            respond_with str
          else
            respond_with nil
          end
        end
      end     
      
      private
      def restrict_access
        @user = User.find_by_single_access_token(params[:access_token])
        head :unauthorized unless @user
      end
 
 
    end
  end
end
