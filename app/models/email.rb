class Email < ApplicationRecord
  
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id

  validates :subject, :content, presence: true

  scope :unread, -> {where(read: false)}
  scope :recent, -> {where('updated_at > ?', Date.today)}

  scope :search, -> (subject) {where('subject LIKE ?', "%#{subject}%")}

end
