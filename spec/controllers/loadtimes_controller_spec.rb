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

describe LoadtimesController do

  # This should return the minimal set of attributes required to create a valid
  # Loadtime. As you add validations to Loadtime, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all loadtimes as @loadtimes" do
      loadtime = Loadtime.create! valid_attributes
      get :index
      assigns(:loadtimes).should eq([loadtime])
    end
  end

  describe "GET show" do
    it "assigns the requested loadtime as @loadtime" do
      loadtime = Loadtime.create! valid_attributes
      get :show, :id => loadtime.id.to_s
      assigns(:loadtime).should eq(loadtime)
    end
  end

  describe "GET new" do
    it "assigns a new loadtime as @loadtime" do
      get :new
      assigns(:loadtime).should be_a_new(Loadtime)
    end
  end

  describe "GET edit" do
    it "assigns the requested loadtime as @loadtime" do
      loadtime = Loadtime.create! valid_attributes
      get :edit, :id => loadtime.id.to_s
      assigns(:loadtime).should eq(loadtime)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Loadtime" do
        expect {
          post :create, :loadtime => valid_attributes
        }.to change(Loadtime, :count).by(1)
      end

      it "assigns a newly created loadtime as @loadtime" do
        post :create, :loadtime => valid_attributes
        assigns(:loadtime).should be_a(Loadtime)
        assigns(:loadtime).should be_persisted
      end

      it "redirects to the created loadtime" do
        post :create, :loadtime => valid_attributes
        response.should redirect_to(Loadtime.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved loadtime as @loadtime" do
        # Trigger the behavior that occurs when invalid params are submitted
        Loadtime.any_instance.stub(:save).and_return(false)
        post :create, :loadtime => {}
        assigns(:loadtime).should be_a_new(Loadtime)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Loadtime.any_instance.stub(:save).and_return(false)
        post :create, :loadtime => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested loadtime" do
        loadtime = Loadtime.create! valid_attributes
        # Assuming there are no other loadtimes in the database, this
        # specifies that the Loadtime created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Loadtime.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => loadtime.id, :loadtime => {'these' => 'params'}
      end

      it "assigns the requested loadtime as @loadtime" do
        loadtime = Loadtime.create! valid_attributes
        put :update, :id => loadtime.id, :loadtime => valid_attributes
        assigns(:loadtime).should eq(loadtime)
      end

      it "redirects to the loadtime" do
        loadtime = Loadtime.create! valid_attributes
        put :update, :id => loadtime.id, :loadtime => valid_attributes
        response.should redirect_to(loadtime)
      end
    end

    describe "with invalid params" do
      it "assigns the loadtime as @loadtime" do
        loadtime = Loadtime.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Loadtime.any_instance.stub(:save).and_return(false)
        put :update, :id => loadtime.id.to_s, :loadtime => {}
        assigns(:loadtime).should eq(loadtime)
      end

      it "re-renders the 'edit' template" do
        loadtime = Loadtime.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Loadtime.any_instance.stub(:save).and_return(false)
        put :update, :id => loadtime.id.to_s, :loadtime => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested loadtime" do
      loadtime = Loadtime.create! valid_attributes
      expect {
        delete :destroy, :id => loadtime.id.to_s
      }.to change(Loadtime, :count).by(-1)
    end

    it "redirects to the loadtimes list" do
      loadtime = Loadtime.create! valid_attributes
      delete :destroy, :id => loadtime.id.to_s
      response.should redirect_to(loadtimes_url)
    end
  end

end
