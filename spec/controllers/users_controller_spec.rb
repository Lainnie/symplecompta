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

  it 'Should be able to sign up' do
    post :signup, user: user_valid
    #pp response.header
    expect(response).to have_http_status(200)
    expect(response.content_type).to eq(Mime::JSON)
  end

  let(:user_invalid) { FactoryGirl.attributes_for(:user_invalid) }
  it 'Should not be valid' do
    post :signup, user: user_invalid
    expect(response).to have_http_status(401)
    expect(response.content_type).to eq(Mime::JSON)
  end

  it 'Should not be able to login' do
    User.create user_valid
    post :signin, user: {
      email: user_valid[:email],
      password: user_invalid[:password]
    }
    expect(response).to have_http_status(401)
    expect(response.content_type).to eq(Mime::JSON)
  end

  it 'Should be logout' do
    request.env['HTTP_AUTHORIZATION'] = token_header(user.authentication_token)
    delete :logout
    expect(request.env['HTTP_AUTHORIZATION']).to eq(nil)
    expect(response).to have_http_status(204)
  end
end
