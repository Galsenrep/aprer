class LesimagesController < ApplicationController

  before_action :set_image, only: [:update, :edit]

  #before_action :authenticate_user!, except: [:show]
  before_action :authenticate_admin!, only: [:destroy]

  def index
    if admin_signed_in? || user_signed_in?
      @lesimage = Lesimage.all.order("created_at DESC")
    else
      redirect_to users_sign_in_path
    end
  end

  def show
    @lesimage = Lesimage.find(params[:id])
  end

  def new
    @lesimage = Lesimage.new
  end

  def create
    @lesimage = Lesimage.new(lesimage_params)

    respond_to do |format|
      if @lesimage.save
        format.html { redirect_to @lesimage, notice: "L'image a été ajouté." }
      else
        format.htmt { render :new }
      end
    end
  end

  def edit
    @lesimage = Lesimage.find(params[:id])
  end

  def update
    @lesimage = Lesimage.find(params[:id])

    if @lesimage.update(lesimage_params)
      redirect_to @lesimage, notice: "L'image a été mise à jour."
    else
      render :edit
    end
  end

  def destroy
    @lesimage = Lesimage.find(params[:id])

    @lesimage = @lesimage.destroy
    redirect_to lesimages_path, notice: "L'image a été supprimer."
  end

  private

  def lesimage_params
    params.require(:lesimage).permit(:titre, :image, :user_id)
  end

  def set_image
    @lesimage = Lesimage.find(params[:id])
  end
end
