class Event < ApplicationRecord
  belongs_to :admin, class_name:"User"
  has_many :attendances
  has_many :user, through: :attendances
  has_many_attached :images

  validates :start_date, presence: true 
  before_update :past_event?
  before_destroy :past_event?
  validates :duration, presence: true, numericality: {greater_than: 0}
  validate :duration_minutes_multiples_of_5
  validates :title, presence: true, length: {in: 5..140}
  validates :description, presence: true, length: {in: 20..1000}
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true


  private 

  def past_event?
    errors.add(:start_date, "can't be past") if start_date < Time.now
  end 

  def duration_minutes_multiples_of_5
    if duration.nil?
      errors.add(:duration, "must be filled") 
    else
      errors.add(:duration, "has to be a multiple of 5") unless (duration % 5 == 0)
      errors.add(:duration, "has to be a positive amount of minutes") unless duration > 0
    end
  end 

end
