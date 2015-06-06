require "json"
class ApiController < ApplicationController
  def all
    render json: Organization.all.to_a
  end
end
