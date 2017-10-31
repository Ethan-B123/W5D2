require 'rails_helper'

RSpec.describe GoalsController, type: :controller do

  let(:steve) { User.create!(username: 'steve', password: "password") }

  describe 'when logged in' do

    before do
      allow(controller).to receive(:current_user) { steve }
    end

    it 'lets you make a new goal' do
      post :create, params: { goal: { title: "Day Off", body: "Sleepzzz"} }
      expect(Goal.last.body).to eq("Sleepzzz")
      expect(response).to have_http_status(302)
    end

    it 'lets you edit your goals' do
      post :create, params: { goal: { title: "Day Off", body: "Sleepzzz"} }
      patch :update, params: { id: Goal.last.id, goal: { title: "Day Off", body: "new"} }
      expect(response).to have_http_status(200)
      expect(Goal.last.body).to eq("new")
    end

    it 'lets you remove a goal' do
      post :create, params: { goal: { title: "Day Off", body: "1"} }
      post :create, params: { goal: { title: "Work Day", body: "2"} }
      delete :destroy, params: { id: Goal.last.id }
      expect(response).to have_http_status(302)
      expect(Goal.last.body).to eq("1")
    end

  end

  describe 'when not logged in' do
    it 'lets you see other people\'s goals'

    context 'sends you to log in page when' do
      it 'try to edit goal'

      it 'try to delete goal'

      it 'try to create goal'
    end
  end

end
