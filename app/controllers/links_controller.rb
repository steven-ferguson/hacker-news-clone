class LinksController < ApplicationController
  def index
    @link = Link.new
    @links = Link.sort_by_score
  end

  def create 
    @link = Link.new(link_params)
    if @link.save
      redirect_to links_path, notice: "Link successfully added!"
    else
      render 'index'
    end
  end

private
  def link_params
    params.require(:link).permit(:url)
  end

end