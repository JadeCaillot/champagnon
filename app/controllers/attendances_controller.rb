class AttendancesController < ApplicationController
  
  def index
    @attendances=Attendance.all
    @event=Event.find(params[:event_id])
  end

  def new
    @attendance=Attendance.new
    @amount=Event.find(params[:event_id]).price
  end

  def create
    # Amount in cents
    @event=Event.find(params[:event_id])
    @amount=Event.find(params[:event_id]).price 

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Eventbrite participation évènement',
      currency: 'eur',
    })
    
    @attendance = Attendance.new(event_id: params[:event_id], participant_id: current_user.id, stripe_customer_id: params[:stripeToken]) 
    if @attendance.save 
      flash[:success] = "Vous êtes maintenant inscrit à l'évènement"
      redirect_to event_path(params[:event_id])
    else
      flash[:error] ="Vous n'avez pas bien rempli les champs ou vous êtes déjà inscrits à cet évènement"
      render new_event_attendance_path(params[:event_id])
    end  
  end

end
