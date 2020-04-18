class AttendanceMailer < ApplicationMailer

  default from:'no-reply@champagnon.fr'

  def attendance_event_email(attendance)
    @participant=attendance.participant 
    @event=attendance.event
    @admin=attendance.event.admin
    @url= 'https://champagnon.herokuapp.com/users/sign_in'
    mail(to: @admin.email, subject: 'Un nouveau participant vient de rejoindre votre évènement !')
  end 

end
