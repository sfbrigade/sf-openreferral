require "rails_helper"

describe OrganizationsController do
  before(:each) { login_admin }

  describe "GET index" do
    it "assigns all organizations as @organizations grouped by status" do
      organization = create(:organization, status: :pending)

      get :index

      expect(assigns(:organization_groups)).to eq("pending" => [organization])
    end
  end

  describe "GET show" do
    it "assigns the requested organization as @organization" do
      organization = create(:organization)

      xhr :get, :show, id: organization.to_param

      expect(assigns(:organization)).to eq(organization)
    end
  end

  describe "GET new" do
    it "assigns a new organization as @organization" do
      get :new

      expect(assigns(:organization)).to be_a_new(Organization)
    end
  end

  describe "GET edit" do
    it "assigns the requested organization as @organization" do
      organization = create(:organization)

      xhr :get, :edit, id: organization.to_param

      expect(assigns(:organization)).to eq(organization)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Organization" do
        expect do
          post :create, organization: attributes_for(:organization)
        end.to change(Organization, :count).by(1)
      end

      it "assigns a newly created organization as @organization" do
        post :create, organization: attributes_for(:organization)

        expect(assigns(:organization)).to be_a(Organization)
        expect(assigns(:organization)).to be_persisted
      end

      it "redirects to the created organization" do
        post :create, organization: attributes_for(:organization)

        expect(response).to redirect_to(Organization.last)
      end

      it "sets the flash" do
        post :create, organization: attributes_for(:organization)

        expect(flash[:notice]).to eq(t("organizations.create.success"))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved organization as @organization" do
        post :create, organization: { name: "" }

        expect(assigns(:organization)).to be_a_new(Organization)
      end

      it "re-renders the 'new' template" do
        post :create, organization: { name: "" }

        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested organization" do
        organization = create(:organization)
        new_name = "San Francisco Social Service Center"
        new_attributes = { name: new_name }

        put :update, id: organization.id, organization: new_attributes

        organization.reload
        expect(organization.name).to eq(new_name)
      end

      it "assigns the requested organization as @organization" do
        organization = create(:organization)
        attributes = attributes_for(:organization)

        put :update, id: organization.to_param, organization: attributes

        expect(assigns(:organization)).to eq(organization)
      end

      it "redirects to the organization" do
        organization = create(:organization)
        attributes = attributes_for(:organization)

        put :update, id: organization.to_param, organization: attributes

        expect(response).to redirect_to(organization)
      end

      it "sets the flash" do
        organization = create(:organization)
        attributes = attributes_for(:organization)

        put :update, id: organization.to_param, organization: attributes

        expect(flash[:notice]).to eq(t("organizations.update.success"))
      end

      it "accepts a list of languages" do
        organization = create(:organization)
        attributes = { languages: ["English", "Spanish"] }

        put :update, id: organization.to_param, organization: attributes

        organization.reload
        expect(organization.languages).to eq(["English", "Spanish"])
      end

      it "accepts a list of services" do
        organization = create(:organization)
        attributes = { service_list: "foo,bar,baz" }

        put :update, id: organization.to_param, organization: attributes

        organization.reload
        expect(organization.service_list.sort).to eq(["bar", "baz", "foo"])
      end
    end

    describe "with invalid params" do
      it "assigns the organization as @organization" do
        organization = create(:organization)

        xhr :put, :update, id: organization.to_param, organization: { name: "" }

        expect(assigns(:organization)).to eq(organization)
      end

      it "re-renders the 'edit' template" do
        organization = create(:organization)

        xhr :put, :update, id: organization.to_param, organization: { name: "" }

        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested organization" do
      organization = create(:organization)

      expect do
        delete :destroy, id: organization.to_param
      end.to change(Organization, :count).by(-1)
    end

    it "redirects to the organizations list" do
      organization = create(:organization)

      delete :destroy, id: organization.to_param

      expect(response).to redirect_to(organizations_url)
    end

    it "sets the flash" do
      organization = create(:organization)

      delete :destroy, id: organization.to_param

      expect(flash[:notice]).to eq(t("organizations.destroy.success"))
    end
  end
end
