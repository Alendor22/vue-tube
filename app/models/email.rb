class Email < ApplicationRecord
  
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id

  validates :receiver, presence: true

  scope :unread, ->{where(read: false)}
  scope :recent, ->{where('updated_at < ?', 5.minutes.ago)}

end
