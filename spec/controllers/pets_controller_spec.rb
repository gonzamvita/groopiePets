require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  describe "GET #index" do
    before :each do
      # user log in
      @user ||= FactoryGirl.create :user
      sign_in @user # method from devise:TestHelpers

      get :index
    end

    it "responds with 200" do
      expect(response).to have_http_status 200
    end

    it "renders the :index view" do
      expect(subject).to render_template(:index)
    end
  end

  describe "GET #show" do
    before(:each) do
      # pet to show
      @pet = FactoryGirl.create(:pet)

      # user log in
      @user ||= FactoryGirl.create :user
      sign_in @user # method from devise:TestHelpers

      get(:show, id: @pet.id)
    end

    it "responds with 200 (found)" do
      expect(response).to have_http_status 200
    end

    it "renders the :show view" do
      expect(subject).to render_template(:show)
    end
  end

  describe "GET #new" do
    before(:each) do
      # user log in
      @user ||= FactoryGirl.create :user
      sign_in @user # method from devise:TestHelpers

      get(:new)
    end

    it "responds with 200 (found)" do
      expect(response).to have_http_status 200
    end

    it "renders the :new template" do
      expect(subject).to render_template(:new)
    end
  end
end
