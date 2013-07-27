module Api
  module V1
    class ActivitiesController < ApplicationController
      before_filter :restrict_access
      respond_to :json
      
      def index
        respond_with @user.activities.all   
      end 
       
      def remote_insert_activity
        @user = User.find_by_single_access_token(params[:access_token])
        @event = Event.find(params[:event_id])
        @activity = Activity.create(:user => @user, :activity_date => params[:activity_date], :distance => params[:distance], :manual => 1, :event => @event)
        
        respond_with @activity
      end
      
      def filteredindex
        @user = User.find_by_single_access_token(params[:access_token])
        @activities = @user.activities.where("id > ?", params[:id])
        respond_with @activities
      end
      
      def show
        @user.activities.find(params[:id])
        respond_with @user.activities.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          respond_with ""
      end
            
      private
      def restrict_access
        @user = User.find_by_single_access_token(params[:access_token])
        head :unauthorized unless @user
      end
 
 
    end
  end
end
