class Atendance < ApplicationRecord
    belongs_to :user
    belongs_to :event

    after_create :send_email_to_event_admin

  def send_email_to_event_admin
    UserMailer.event_participation_email(self).deliver_now
  end
end
