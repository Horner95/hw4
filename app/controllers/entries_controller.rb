class EntriesController < ApplicationController

  def new
  end

  def create
    if session["user_id"] == nil
      flash["notice"] = "You must be logged in to create an entry."
      redirect_to "/login"
    else
      @entry = Entry.new({ 
        "title" => params["entry"]["title"], 
        "description" => params["entry"]["description"], 
        "occurred_on" => params["entry"]["occurred_on"], 
        "place_id" => params["entry"]["place_id"], 
        "user_id" => session["user_id"], 
        "image_url" => params["entry"]["image_url"]  # ✅ Now correctly saves image URL
      })

      if @entry.save
        flash["notice"] = "New entry created!"
        redirect_to "/places/#{@entry.place_id}"
      else
        render "new"
      end
    end
  end

end
