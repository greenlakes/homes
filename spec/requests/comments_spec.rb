require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/comments", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let!(:comment) { create(:comment) }

  let(:valid_attributes) {
    (attributes_for(:comment)).merge(user_id: user.id, project_id: project.id, project_attributes: { status: 'active' })
  }

  let(:invalid_attributes) {
    { title: "This is a title" }.merge(user_id: user.id, project_id: project.id, project_attributes: { status:
                                                                                                         'active' })
  }

  before do
    sign_in user
  end

  describe "GET /index" do
    it "renders a successful response" do
      get project_comments_url(project)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get project_comment_url(project, comment)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_project_comment_url(project)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_project_comment_url(project, comment)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Comment" do
        expect {
          post project_comments_url(project), params: { comment: valid_attributes }
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the project page showing created comment" do
        post project_comments_url(project), params: { comment: valid_attributes }
        expect(response).to redirect_to(project_url(project))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Comment" do
        expect {
          post project_comments_url(project), params: { comment: invalid_attributes }
        }.to change(Comment, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post project_comments_url(project), params: { comment: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { content: 'Updated comment', user: user, project: project }
      }

      it "updates the requested comment" do
        patch project_comment_url(project, comment), params: { comment: new_attributes }
        comment.reload
        expect(comment.content).to eq('Updated comment')
      end

      it "redirects to the comment" do
        patch project_comment_url(project, comment), params: { comment: new_attributes }
        comment.reload
        expect(response).to redirect_to(project_url(project))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch project_comment_url(project, comment), params: { comment: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested comment" do
      expect {
        delete project_comment_url(project, comment)
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      delete project_comment_url(project, comment)
      expect(response).to redirect_to(projects_url)
    end
  end
end
