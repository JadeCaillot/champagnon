class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :attendances, foreign_key: "participant_id", class_name: "Attendance"
    has_many :events, through: :attendances
    has_many :events, foreign_key: "admin_id", class_name: "Event"

    after_create :welcome_send

    def welcome_send
        UserMailer.welcome_email(self).deliver_now
    end 


    def is_already_attending?(event)
        participants_id = event.attendances.pluck("participant_id")
        participants_id.include?(self.id.to_i)
    end
    
    def is_admin?(event)
        event.admin.id.to_i == self.id.to_i ? true : false
    end

end
