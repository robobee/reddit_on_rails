require 'rails_helper'

RSpec.describe LinksController, type: :controller do

  describe 'GET #show' do
    let(:link) { create(:link_with_comments) }

    before(:each) do
      get :show, id: link
    end

    it "assigns the requested link to @link" do
      expect(assigns(:link)).to eq link
    end

    it "set ups a new comment" do
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it "populates an array of comments" do
      expect(assigns(:comments)).to match_array link.comments
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    
    before(:each) do
      login_user
      get :new
    end

    it "assigns a new Link to @link" do
      expect(assigns(:link)).to be_a_new(Link)
    end

    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    let(:user) { create(:user) }

    context 'when logged in' do
      before(:each) do
        login_user
      end

      context 'with valid attributes' do
        it 'saves new link in database' do
          expect {
            post :create, link: attributes_for(:link)
          }.to change(Link, :count).by(1)
        end
        
        it 'redirects to links#show' do
          post :create, link: attributes_for(:link)
          expect(response).to redirect_to link_path(assigns[:link])
        end
      end

      context 'with invalid attributes' do
        it 'does not save the new link in the database' do
          expect {
            post :create, link: attributes_for(:invalid_link)
          }.not_to change(Link, :count)
        end

        it 're-renders the :new template' do
          post :create, link: attributes_for(:invalid_link)
          expect(response).to render_template :new
        end
      end

    end

    context 'when not logged in' do
      it 'redirects to root_path' do
        post :create, link: attributes_for(:link)
        expect(response).to redirect_to new_user_session_path
      end
    end

  end

end
