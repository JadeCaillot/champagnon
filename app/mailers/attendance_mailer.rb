class AttendanceMailer < ApplicationMailer

    default from:'no-reply@monsite.fr'

    def attendance_event_email(attendance)
        @participant=attendance.participant 
        @event=attendance.event
        @admin=attendance.event.admin
        @url= 'http://monsite.fr/login'
        mail(to: @admin.email, subject: 'Un nouveau participant vient de rejoindre votre évènement !')
    end 

end
