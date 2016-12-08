class ChoicesController < ApplicationController
  def index
    @choices = Choice.all

    render("choices/index.html.erb")
  end

  def show
    @choice = Choice.find(params[:id])

    render("choices/show.html.erb")
  end

  def new
    @choice = Choice.new

    render("choices/new.html.erb")
  end

  def create
    @choice = Choice.new

    @choice.event_id = params[:event_id]
    @choice.venue_id = params[:venue_id]

    save_status = @choice.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/choices/new", "/create_choice"
        redirect_to("/choices")
      else
        redirect_back(:fallback_location => "/", :notice => "Choice created successfully.")
      end
    else
      render("choices/new.html.erb")
    end
  end

  def edit
    @choice = Choice.find(params[:id])

    render("choices/edit.html.erb")
  end

  def update
    @choice = Choice.find(params[:id])

    @choice.event_id = params[:event_id]
    @choice.venue_id = params[:venue_id]

    save_status = @choice.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/choices/#{@choice.id}/edit", "/update_choice"
        redirect_to("/choices/#{@choice.id}", :notice => "Choice updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Choice updated successfully.")
      end
    else
      render("choices/edit.html.erb")
    end
  end

  def destroy
    @choice = Choice.find(params[:id])

    @choice.destroy

    if URI(request.referer).path == "/choices/#{@choice.id}"
      redirect_to("/", :notice => "Choice deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Choice deleted.")
    end
  end
end
