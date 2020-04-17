class Attendance < ApplicationRecord
    belongs_to :participant, class_name: "User"
    belongs_to :event

    def attendance_event_send
        AttendanceMailer.attendance_event_email(self).deliver_now
    end 
end
