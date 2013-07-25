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
            respond_with '[{"distance:"'+Event.find(selectedEvent).activities.sum("distance").to_s+'"}]'
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
            respond_with Team.find_by_sql("SELECT teams.id AS TEAM, registrations.user_id, activities.id, activities.distance FROM teams INNER JOIN registrations ON teams.id=registrations.team_id INNER JOIN activities ON registrations.user_id = activities.user_id WHERE teams.event_id=18 AND activities.event_id = 18 ORDER BY TEAM")
          else
            respond_with nil
          end
        end
      end
      
      def restrict_access
        api_key = User.find_by_single_access_token(params[:access_token])
        head :unauthorized unless api_key
      end
 
 
    end
  end
end
