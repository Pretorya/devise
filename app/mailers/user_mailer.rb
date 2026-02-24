class UserMailer < ApplicationMailer
  default from: ENV["GMAIL_USERNAME"]

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 

    
  end

  def event_participation_email(attendance)
    @attendance = attendance
    @event = attendance.event
    @admin = @event.user
    @participant = attendance.user

    mail(
      to: @admin.email,
      subject: "Nouvelle participation à ton événement !"
    )
  end
end