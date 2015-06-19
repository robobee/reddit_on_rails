require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  let!(:links) { [create(:link), create(:link), create(:link)] }

  describe "GET #index" do

    before(:each) do
      get :index
    end

    it "assigns links to @links" do
      expect(assigns(:links)).to match_array(links)
    end

    it "renders :index template" do
      expect(response).to render_template(:index)
    end
    
  end

end
