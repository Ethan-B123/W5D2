require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    it 'render new page with bad params' do
      post :create, params: { user: { username: nil, password: nil}}
      expect(response).to render_template('new')
    end

    it 'creates users with valid params' do
      post :create, params: { user: { username: "steve", password: "password"}}
      expect(response).to have_http_status(302)
      expect(User.last.username).to eq("steve")
    end

    it 'redirects to goals index' do
      post :create, params: { user: { username: "steve", password: "password"}}
      expect(response).to redirect_to(goals_url)
    end
  end

  describe 'GET #new' do
    it 'renders new user page' do
      get :new
      expect(response).to render_template('new')
    end
  end

end
