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
      
      def restrict_access
        api_key = User.find_by_single_access_token(params[:access_token])
        head :unauthorized unless api_key
      end
 
 
    end
  end
end
