class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = Organization.all
  end

  def pending
    @organizations = Organization.where(status: "pending")
  end

  def show
  end

  def new
    @organization = Organization.new
  end

  def edit
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      redirect_to @organization, notice: t(".success")
    else
      render :new
    end
  end

  def update
    if @organization.update(organization_params)
      if organization_params[:status] == "approved"
        redirect_to "/pending", notice: "#{@organization.name} was approved"
      else
        redirect_to @organization, notice: t(".success")
      end
    else
      render :edit
    end
  end

  def destroy
    @organization.destroy
    redirect_to organizations_url, notice: t(".success")
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(
      :address,
      :description,
      :email,
      :name,
      :phone,
      :url,
      :status,
    )
  end
end
