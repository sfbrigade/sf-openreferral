class TagsController < ApplicationController
  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @organizations = Organization.tagged_with(@tag.name)
  end
end
