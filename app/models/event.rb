class Event < ApplicationRecord
  validates :start_date, presence: true
  validate :date_cannot_be_in_the_past
  validates :duration, presence: true
  validate :duration_validation
  validates :title, presence: true, length: {minimum: 5, maximum: 140}
  validates :description, presence: true, length: {minimum: 20, maximum: 1000}
  validates :price, presence: true, numericality: { in: 1..1000 }
  validates :location, presence: true

  has_many :users, through: :atendances, source: :user
  has_many :atendances
  belongs_to :user
    
    
  private

    def date_cannot_be_in_the_past
      if start_date.present? && start_date < Date.today
        errors.add(:start_date, "la date ne peut être déja passée")
      end
    end

    def duration_validation
      if duration <= 0 || duration % 5 != 0
        errors.add(:duration, "Un nombre positif, par tranche de 5 minutes seulement")
      end
  
  end
end
