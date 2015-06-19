require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe 'POST #create' do
    let(:link) { create(:link) }

    context 'when logged in' do
      before(:each) do
        login_user
      end

      context 'with valid attributes' do
        it 'saves new comment in database' do
          expect {
            post :create, comment: attributes_for(:comment), link_id: link.id
          }.to change(Comment, :count).by(1)
        end
        
        it 'redirects to links#show' do
          post :create, comment: attributes_for(:comment), link_id: link.id
          expect(response).to redirect_to link_path(assigns[:link])
        end
      end

      context 'with invalid attributes' do
        it 'does not save the new link in the database' do
          expect {
            post :create, comment: attributes_for(:invalid_comment), link_id: link.id
          }.not_to change(Comment, :count)
        end

        it 'redirects to links#show' do
          post :create, comment: attributes_for(:comment), link_id: link.id
          expect(response).to redirect_to link_path(assigns[:link])
        end
      end

    end

    context 'when not logged in' do
      it 'redirects to root_path' do
        post :create, comment: attributes_for(:comment), link_id: link.id
        expect(response).to redirect_to new_user_session_path
      end
    end

  end

end
