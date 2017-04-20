class ActualitesController < ApplicationController
  def index
    @articles = Article.all.order("created_at DESC").paginate(:page => params[:page])
    #if params[:search]
    #  @articles = Article.search(params[:search]).order("created_at Desc")
    #end
    if params[:search]
      @articles = Article.search(params[:search]).order("created_at DESC").paginate(:page => params[:page])
    else
      @articles = Article.all.order('created_at DESC').paginate(:page => params[:page])
    end

  end

end
