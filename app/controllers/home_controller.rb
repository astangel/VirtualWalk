class HomeController < ApplicationController
  # GET /activities
  # GET /activities.json
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end