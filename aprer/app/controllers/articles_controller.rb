class ArticlesController < ApplicationController

  before_action :set_article, only: [:update, :edit]
  #before_action :authenticate_user!, except: [:show]
  before_action :authenticate_admin!, :set_article, only: [:destroy]

  def index
    if admin_signed_in? || user_signed_in?
      @articles = Article.all.order("created_at DESC")
    else
      redirect_to new_user_registration_path
    end
  end

  def show
      @article=Article.find_by_slug(params[:slug])
      #@article=Article.find(params[:id])
  end

  def new
    if admin_signed_in?
      @article = Article.new
    else
      @article= current_user.articles.build
    end
  end

  def create
    @article = Article.create(article_params)
    redirect_to articles_path+"/"+@article.slug, notice: "Article créé avec succès !"
  end

  def edit
    @article=Article.find(params[:id])
    #render text: @article.inspect

  end

  def update
    @article=Article.find(params[:id])
    @article.update(article_params)
    redirect_to articles_path+"/"+@article.slug, notice: "Articles modifié avec succès !"
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "Article supprimé avec succès !"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image, :id, :slug, :user_id)
  end
  #def set_article
  #  @article=Article.find(params[:id])
  #end

  def set_article
    @article=Article.find_by(slug: params[:slug])
  end

end
