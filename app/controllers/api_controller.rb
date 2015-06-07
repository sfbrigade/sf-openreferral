require "json"
class ApiController < ApplicationController
  include ApiHelper
  SUPPORTED_FORMATS = ["markdown","docx","json"]
  def export_all
    response_data = Organization.all.to_a
    respond_to_format(response_data, "all")
  end

  def export_organization
    id = params[:id]
    response_data = [Organization.find(id)]
    respond_to_format(response_data, id.to_s)
  end

  def respond_to_format(response_data, filename)
    respond_to do |format|
      format.json { render json: response_data }
      format.docx do 
        send_data export_organizations_as_docx(response_data), filename: "#{filename}.docx" 
      end
      format.markdown {render text: export_organizations_as_markdown(response_data)}
    end
  end

  def export_formats
    render json: SUPPORTED_FORMATS
  end
end
