require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "POST #create" do
    it "logs in a new user" do
      request.env["omniauth.auth"] = {
        'provider' => 'twitter',
        'info' => {'name' => 'Alice Smith'},
        'uid' => 'abc123'
      }

      post :create
      user = User.find_by_uid_and_provider('abc123', 'twitter')
      expect(controller.current_user.id).to eq(user.id)
    end

    it "logs in an existing user" do
      request.env["omniauth.auth"] = {
        'provider' => 'twitter',
        'info' => {'name' => 'Bob Jones'},
        'uid' => 'xyz456'
      }
      user = User.create(provider: 'twitter', uid: 'xyz456', name: 'Bob Jones')

      post :create
      expect(User.count).to eq(1)
      expect(controller.current_user.id).to eq(user.id)
    end

    it "redirects to the site index page" do
      request.env["omniauth.auth"] = {
        'provider' => 'twitter',
        'info' => {'name' => 'Charlie Allen'},
        'uid' => 'prq987'
      }

      user = User.create(provider: 'twitter', uid: 'prq987', name: 'Charlie Allen')
      post :create
      expect(response).to redirect_to(root_path)
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      Rails.application.routes.draw do
        root 'site#index'
        resource :sessions, :only => [:create, :destroy]
      end
    end

    it "logs out" do
      user = User.create(provider: 'twitter', uid: 'xyz456', name: 'Bob Jones')
      session[:user_id] = user.id

      delete :destroy

      expect(session[:user_id]).to be_nil
    end

    it "redirects the user to the site#index page after logout" do
      user = User.create(provider: 'twitter', uid: 'xyz456', name: 'Bob Jones')
      session[:user_id] = user.id

      delete :destroy

      expect(response).to redirect_to(root_path)
    end

  end
end