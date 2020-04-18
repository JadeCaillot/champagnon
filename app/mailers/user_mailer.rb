class UserMailer < ApplicationMailer
default from:'no-reply@champagnon.fr'

  def welcome_email(user)
    @user=user 
    @url= 'https://champagnon.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Bienvenue sur Champagnon !')
  end 

end
