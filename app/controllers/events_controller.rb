class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :is_admin?, only: [ :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Événement créé !"
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
  end

  def is_admin?
    redirect_to root_path, alert: "Tu n'es pas autorisé" unless current_user == @event.user
  end
end