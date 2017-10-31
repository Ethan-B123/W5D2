class Goal < ApplicationRecord
  validates :user_id, :body, :title, presence: true

  belongs_to :user

  before_save :default_values
  def default_values
    if hidden.nil?
      self.hidden = false
    else
      self.hidden = true
    end
  end
end
