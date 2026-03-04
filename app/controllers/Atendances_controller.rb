class AtendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  before_action :is_admin?, only: [:index]

  def new
    # page avec bouton Stripe
  end

  def create
    if @event.is_free?
      Atendance.create(user: current_user, event: @event)
      redirect_to @event, notice: "Tu es inscrit 🎉"
    else
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          price_data: {
            currency: 'eur',
            product_data: {
              name: @event.title
            },
            unit_amount: @event.price * 100
          },
          quantity: 1
        }],
        mode: 'payment',
        success_url: event_url(@event),
        cancel_url: event_url(@event)
      )

      redirect_to session.url, allow_other_host: true
    end
  end

  def index
    @atendances = @event.atendances
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def is_admin?
    redirect_to root_path, alert: "Tu n'es pas autorisé ici 😬" unless current_user == @event.user
  end
end