class EventsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @events = Event.all 
  end

  def show
    @event = Event.find(params[:id])
    @admin = User.where(user_id: params[:id])
    @participant = @event.attendances.pluck("participant_id")
    @images = @event.images
  end

  def new
    @event = Event.new
  end 

  def create
    @event = Event.new(event_params)
    @event.admin = current_user
    if @event.save
      redirect_to event_path(@event.id)
      flash[:success] = "L'évènement a été ajouté avec succès !"
    else
      puts "Ca n'a pas fonctionné désolé"
      render :new
    end
  end 

  def edit
    @event = Event.find(params[:id])
    @images = @event.images
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event.id)
      flash[:success] = "L'évènement a été modifié avec succès !"
    else
      render :edit
    end 
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end 

  private
  def authenticate_user
    unless current_user
      flash[:danger] = "Vous devez être connecté pour accéder à cette page"
      redirect_to new_user_session_path
    end
  end
  
  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, images: [] )
  end

end
