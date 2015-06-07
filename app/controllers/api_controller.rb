require "json" 
class ApiController < ApplicationController
  include ApiHelper
  def all
    respond_to do |format|
      response_data = Organization.all.to_a
      format.json { render json: response_data }
      format.docx { send_data export_organizations_as_docx(response_data) }
      format.markdown {render text: export_organizations_as_markdown(response_data)}
    end
  end
end
