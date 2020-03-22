class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  # polymorphic relationship
  has_many :sent_emails, class_name: "Email", foreign_key: :sender_id
  has_many :received_emails, class_name: "Email", foreign_key: :receiver_id
  has_many :to_contacts, -> { distinct }, through: :sent_emails, source: :receiver
  has_many :from_contacts, -> { distinct }, through: :received_emails, source: :sender

  validates :name, presence: true

        # Sign-in using Oauth, or User is created using Oauth, returns the User
        def self.from_omniauth(access_token)

          data = access_token.info
          user = User.find_by(email: data['email'])
          
          # Uncomment the section below if you want users to be created if they don't exist
          unless user
              user = User.create(
                name: data["name"],
                email: data['email'],
                password: Devise.friendly_token[0,20]
              )
          end
          user
        end


        # def destroy_email(email_id)
        #   if email = sent_emails.find_by_id(email_id)
        #     email.destroy
        #   elsif email = received_emails.find_by_id(email_id)
        #     email.destroy
        #   end
        # end
  
end
