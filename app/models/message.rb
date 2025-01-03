class Message < ApplicationRecord
  belongs_to :binome
  belongs_to :sender, class_name: "User", foreign_key: 'user_id'

  validates :content, presence: true

  #Ensures the sender is a participant of the binome
  validates :sender, inclusion: {
    in: ->(message) { [message.binome.user_1, message.binome.user_2] },
    message: "must be a participant of the binome"
  }

  #The broadcasting logic ensures messages are sent to both participants.
  after_create_commit -> {
    # Create a unique stream name for each user in the binome
    [self.binome.user_1, self.binome.user_2].each do |recipient|
      broadcast_append_to [self.binome, recipient, "messages"],
                         partial: "messages/message",
                         locals: { message: self, user: recipient },
                         target: "messages"
    end
  }

  #Returns the other user in the binome
  def receiver
    binome.other_user(sender)
  end

  #Checks if the user is the sender of the message
  def sender?(user)
    sender == user
  end
end
