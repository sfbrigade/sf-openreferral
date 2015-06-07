class ImportsController < ApplicationController
  def show
    @import = Import.find(params[:id])
  end

  def new
    @import = Import.new
  end

  def create
    @import = Import.create(import_params)
    @import.delay.import
    redirect_to @import, notice: t(".success")
  end

  private

  def import_params
    params.required(:import).permit(:data_url)
  end
end
