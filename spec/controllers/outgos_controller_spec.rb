require 'rails_helper'

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

RSpec.describe OutgosController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Outgo. As you add validations to Outgo, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OutgosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all outgos as @outgos" do
      outgo = Outgo.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:outgos)).to eq([outgo])
    end
  end

  describe "GET show" do
    it "assigns the requested outgo as @outgo" do
      outgo = Outgo.create! valid_attributes
      get :show, {:id => outgo.to_param}, valid_session
      expect(assigns(:outgo)).to eq(outgo)
    end
  end

  describe "GET new" do
    it "assigns a new outgo as @outgo" do
      get :new, {}, valid_session
      expect(assigns(:outgo)).to be_a_new(Outgo)
    end
  end

  describe "GET edit" do
    it "assigns the requested outgo as @outgo" do
      outgo = Outgo.create! valid_attributes
      get :edit, {:id => outgo.to_param}, valid_session
      expect(assigns(:outgo)).to eq(outgo)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Outgo" do
        expect {
          post :create, {:outgo => valid_attributes}, valid_session
        }.to change(Outgo, :count).by(1)
      end

      it "assigns a newly created outgo as @outgo" do
        post :create, {:outgo => valid_attributes}, valid_session
        expect(assigns(:outgo)).to be_a(Outgo)
        expect(assigns(:outgo)).to be_persisted
      end

      it "redirects to the created outgo" do
        post :create, {:outgo => valid_attributes}, valid_session
        expect(response).to redirect_to(Outgo.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved outgo as @outgo" do
        post :create, {:outgo => invalid_attributes}, valid_session
        expect(assigns(:outgo)).to be_a_new(Outgo)
      end

      it "re-renders the 'new' template" do
        post :create, {:outgo => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested outgo" do
        outgo = Outgo.create! valid_attributes
        put :update, {:id => outgo.to_param, :outgo => new_attributes}, valid_session
        outgo.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested outgo as @outgo" do
        outgo = Outgo.create! valid_attributes
        put :update, {:id => outgo.to_param, :outgo => valid_attributes}, valid_session
        expect(assigns(:outgo)).to eq(outgo)
      end

      it "redirects to the outgo" do
        outgo = Outgo.create! valid_attributes
        put :update, {:id => outgo.to_param, :outgo => valid_attributes}, valid_session
        expect(response).to redirect_to(outgo)
      end
    end

    describe "with invalid params" do
      it "assigns the outgo as @outgo" do
        outgo = Outgo.create! valid_attributes
        put :update, {:id => outgo.to_param, :outgo => invalid_attributes}, valid_session
        expect(assigns(:outgo)).to eq(outgo)
      end

      it "re-renders the 'edit' template" do
        outgo = Outgo.create! valid_attributes
        put :update, {:id => outgo.to_param, :outgo => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested outgo" do
      outgo = Outgo.create! valid_attributes
      expect {
        delete :destroy, {:id => outgo.to_param}, valid_session
      }.to change(Outgo, :count).by(-1)
    end

    it "redirects to the outgos list" do
      outgo = Outgo.create! valid_attributes
      delete :destroy, {:id => outgo.to_param}, valid_session
      expect(response).to redirect_to(outgos_url)
    end
  end

end
