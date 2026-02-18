class EntriesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @place = Place.find(params[:place_id])
    @entry = Entry.new
  end

  def create
    @entry = Entry.new
    @entry.title = params.fetch(:entry, {}).fetch(:title, "").strip
    @entry.description = params.fetch(:entry, {}).fetch(:description, "").strip
    @entry.occurred_on = params.fetch(:entry, {}).fetch(:occurred_on, "")
    @entry.place_id = params.fetch(:entry, {}).fetch(:place_id, "")

    if @entry.save
      redirect_to place_path(@entry.place_id)
    else
      @place = Place.find(@entry.place_id)
      render "new"
    end
  end
end
