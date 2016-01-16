require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  describe 'GET index' do
    it 'render the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'respond with a 200 status code' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
