require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ProjectsController do
  include_context 'valid session'
  # This should return the minimal set of attributes required to create a valid
  # Project. As you add validations to Project, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "valid name" } }
  let(:invalid_attributes) { { "name" => "s" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProjectsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  it "raises RecordNotFound" do
    expect {
      get :show, { id: 1 }, valid_session
    }.to raise_error(ActiveRecord::RecordNotFound)
  end
  # ====================================================================================================================
  describe "GET index" do
    let(:project) { user.projects.create valid_attributes }

    before :each do
      get :index, {}, valid_session
    end

    it "assigns all projects as @projects" do
      expect(assigns(:projects)).to include(project)
    end

    it "renders the index.json template" do
      expect(response).to render_template('index.json')
    end

    it "is successful" do
      expect(response.status).to eq(200)
    end
  end
  # ====================================================================================================================
  describe "GET show" do
    let(:project) { user.projects.create valid_attributes }

    before :each do
      get :show, {id: project.to_param}, valid_session
    end

    it "assigns the requested project as @project" do
      expect(assigns(:project)).to eq(project)
    end

    it "renders the show.json template" do
      expect(response).to render_template('show.json')
    end

    it "is successful" do
      expect(response.status).to eq(200)
    end
  end
  # ====================================================================================================================
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, {:project => valid_attributes}, valid_session
        }.to change(user.projects, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, {:project => valid_attributes}, valid_session
        expect(assigns(:project)).to be_a(Project)
        expect(assigns(:project)).to be_persisted
      end

      it "renders the show.json template" do
        post :create, {:project => valid_attributes}, valid_session
        expect(response).to render_template('show.json')
      end

      it "is successful" do
        post :create, {:project => valid_attributes}, valid_session
        expect(response.status).to eq(200)
      end
    end

    describe "with invalid params" do
      before :each do
        Project.any_instance.stub(:save).and_return(false)
      end

      it "fails to create a new Project" do
        expect {
          post :create, {:project => invalid_attributes}, valid_session
        }.to change(user.projects, :count).by(0)
      end

      it "assigns a newly created but unsaved project as @project" do
        post :create, {:project => invalid_attributes}, valid_session
        assigns(:project).should be_a_new(Project)
      end

      it "renders errors" do
        # Trigger the behavior that occurs when invalid params are submitted
        Project.any_instance.should_receive(:errors).and_return('errors')
        post :create, {:project => valid_attributes}, valid_session
        expect(response.body).to eq('errors')
      end

      it "responds with 422" do
        post :create, {:project => invalid_attributes}, valid_session
        expect(response.status).to eq(422)
      end
    end
  end
  # ====================================================================================================================
  describe "PUT update" do
    let(:project) { user.projects.create valid_attributes }

    describe "with valid params" do
      it "updates the requested project" do
        Project.any_instance.should_receive(:update)
        put :update, {:id => project.to_param, :project => valid_attributes}, valid_session
        expect(assigns(:project)).to be_valid
      end

      it "assigns the requested project as @project" do
        put :update, {:id => project.to_param, :project => valid_attributes}, valid_session
        assigns(:project).should eq(project)
      end

      it "renders show.json" do
        put :update, {:id => project.to_param, :project => valid_attributes}, valid_session
        expect(response).to render_template('show.json')
      end

      it "is successful" do
        put :update, {:id => project.to_param, :project => valid_attributes}, valid_session
        expect(response.status).to eq(200)
      end
    end

    describe "with invalid params" do
      before :each do
        Project.any_instance.stub(:update).and_return(false)
      end

      let!(:params) { {:id => project.to_param, :project => valid_attributes} }

      it "fails to update a project" do
        Project.any_instance.should_receive(:update)
        put :update, params, valid_session
      end

      it "assigns the project as @project" do
        put :update, params, valid_session
        assigns(:project).should eq(project)
      end

      it "renders errors" do
        Project.any_instance.should_receive(:errors).and_return('errors')
        put :update, params, valid_session
        expect(response.body).to eq('errors')
      end

      it "responds with 422" do
        put :update, params, valid_session
        expect(response.status).to eq(422)
      end
    end
  end
  # ====================================================================================================================
  describe "DELETE destroy" do
    let(:project) { user.projects.create! valid_attributes }

    it "renders nothing" do
      expect(response.body).to be_empty
    end

    # TODO: "with successful destroy" ?
    describe "with successful destroy" do
      it "destroys the requested project" do
        project = user.projects.create! valid_attributes
        Project.any_instance.should_receive(:destroy).and_call_original

        expect {
          delete :destroy, {:id => project.to_param}, valid_session
        }.to change(user.projects, :count).by(-1)
      end

      it "assigns destroyed project as @project" do
        delete :destroy, {:id => project.to_param}, valid_session
        expect(assigns(:project)).to eq(project)
        expect(assigns(:project)).to be_destroyed
      end

      it "responds with 204" do
        delete :destroy, {:id => project.to_param}, valid_session
        expect(response.status).to eq(204)
      end
    end
    # TODO: "with failed destroy" ?
    describe "with failed destroy" do
      before :each do
        Project.any_instance.stub(:destroy).and_return(false)
      end

      it "fails to destroy project" do
        Project.any_instance.should_receive(:destroy)
        project = user.projects.create! valid_attributes
        expect {
          delete :destroy, {:id => project.to_param}, valid_session
        }.to change(user.projects, :count).by(0)
      end

      it "assigns not destroyed project as @project" do
        delete :destroy, {:id => project.to_param}, valid_session
        expect(assigns(:project)).to eq(project)
        expect(assigns(:project)).to_not be_destroyed
      end

      it "responds with 422" do
        delete :destroy, {:id => project.to_param}, valid_session
        expect(response.status).to eq(422)
      end
    end
  end
end
