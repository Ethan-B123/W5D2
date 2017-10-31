require 'rails_helper'

RSpec.describe Goal, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject(:goal) {Goal.new(title: "Day off", body: "Gym, Eat, Sleep")}

  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user_id) }
  it { should belong_to(:user)}


end
