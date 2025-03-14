class PlacesController < ApplicationController

  def index
    if session["user_id"] == nil
      flash["notice"] = "You must be logged in to see entries."
      redirect_to "/login"
    else
      @places = Place.where(user_id: session["user_id"])
    end
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"] })
  end

  def new
  end

  def create
    if session["user_id"] == nil
      flash["notice"] = "You must be logged in."
      redirect_to "/login"
    else
      @entry = Entry.new(entry_params)
      @entry.user_id = session["user_id"]
      
      if @entry.save
        flash["notice"] = "Entry created!"
        redirect_to "/entries"
      else
        render :new
      end
    end
  end

end
