module Api
  module V1
    
    
    class UsersController < ApplicationController
      before_filter :require_http_auth_user, :only => :login
      
      respond_to :json
      
      def login
        @user = current_user
        respond_with @user
      end
      
      def validate_token
        @user = User.find_by_single_access_token(params[:token])
        respond_with @user
      end
      
    
      def require_http_auth_user
        authenticate_or_request_with_http_basic do |username, password|
          if user = User.find_by_username(username) 
            user.valid_password?(password)
          else
            respond_with nil
          end # end if
        end # end authenticate_or_request_with_http_basic
      end # end def
      
      
    end #end class
        
    
    
    
  end #end module V1
end #end module API