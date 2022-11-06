class ArticlesController < ApplicationController
  def index
    @articles = ArticlesHandler.call
    @ratings = Rating.sum_by_object
  end

  def like
    if Rating.create(like_params)
      flash[:success] = 'Successfully liked this article'
    else
      flash[:error] = 'Failed to like this article. Please try again later.'
    end
    redirect_to root_path
  end

  def like_params
    params.permit(:rated_object_id, :value)
  end
end
