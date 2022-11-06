class ArticlesController < ApplicationController
  def index
    @articles = ArticlesHandler.call
  end
end
