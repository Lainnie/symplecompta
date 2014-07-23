require 'rails_helper'
require 'pp'
RSpec.describe UsersController, :type => :controller do
  let!(:user) { FactoryGirl.create(:user) }

  it 'Should have access' do
    request.env['HTTP_AUTHORIZATION'] = token_header(user.authentication_token)
    get :index
    expect(response).to have_http_status(200)
    expect(response.content_type).to eq(Mime::JSON)
  end

  let!(:user_valid) { FactoryGirl.attributes_for(:user) }
  it 'Should be able to log in' do
    user = User.create user_valid
    post :signin, user: { email: user.email, password: user_valid[:password] }
    expect(response).to have_http_status(200)
    expect(response.content_type).to eq(Mime::JSON)
  end

  let!(:user_valid) { FactoryGirl.attributes_for(:user) }
  it 'Should be able to sign up' do
    post :signup, user: user_valid
    pp response.header
    expect(response).to have_http_status(200)
    expect(response.content_type).to eq(Mime::JSON)
  end
end
