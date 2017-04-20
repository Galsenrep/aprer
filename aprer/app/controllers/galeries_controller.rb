class GaleriesController < ApplicationController
  def index
    @lesimage = Lesimage.all.order("created_at DESC")
  end
end
