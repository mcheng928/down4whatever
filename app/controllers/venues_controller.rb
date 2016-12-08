class VenuesController < ApplicationController
  def index
    @q = Venue.ransack(params[:q])
    @venues = @q.result(:distinct => true).includes(:choices).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@venues.where.not(:state_latitude => nil)) do |venue, marker|
      marker.lat venue.state_latitude
      marker.lng venue.state_longitude
      marker.infowindow "<h5><a href='/venues/#{venue.id}'>#{venue.created_at}</a></h5><small>#{venue.state_formatted_address}</small>"
    end
    @location_hash = Gmaps4rails.build_markers(@venues.where.not(:city_latitude => nil)) do |venue, marker|
      marker.lat venue.city_latitude
      marker.lng venue.city_longitude
      marker.infowindow "<h5><a href='/venues/#{venue.id}'>#{venue.created_at}</a></h5><small>#{venue.city_formatted_address}</small>"
    end
    @location_hash = Gmaps4rails.build_markers(@venues.where.not(:address_latitude => nil)) do |venue, marker|
      marker.lat venue.address_latitude
      marker.lng venue.address_longitude
      marker.infowindow "<h5><a href='/venues/#{venue.id}'>#{venue.created_at}</a></h5><small>#{venue.address_formatted_address}</small>"
    end

    render("venues/index.html.erb")
  end

  def show
    @choice = Choice.new
    @venue = Venue.find(params[:id])

    render("venues/show.html.erb")
  end

  def new
    @venue = Venue.new

    render("venues/new.html.erb")
  end

  def create
    @venue = Venue.new

    @venue.address = params[:address]
    @venue.city = params[:city]
    @venue.state = params[:state]
    @venue.name = params[:name]

    save_status = @venue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venues/new", "/create_venue"
        redirect_to("/venues")
      else
        redirect_back(:fallback_location => "/", :notice => "Venue created successfully.")
      end
    else
      render("venues/new.html.erb")
    end
  end

  def edit
    @venue = Venue.find(params[:id])

    render("venues/edit.html.erb")
  end

  def update
    @venue = Venue.find(params[:id])

    @venue.address = params[:address]
    @venue.city = params[:city]
    @venue.state = params[:state]
    @venue.name = params[:name]

    save_status = @venue.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/venues/#{@venue.id}/edit", "/update_venue"
        redirect_to("/venues/#{@venue.id}", :notice => "Venue updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Venue updated successfully.")
      end
    else
      render("venues/edit.html.erb")
    end
  end

  def destroy
    @venue = Venue.find(params[:id])

    @venue.destroy

    if URI(request.referer).path == "/venues/#{@venue.id}"
      redirect_to("/", :notice => "Venue deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Venue deleted.")
    end
  end
end
