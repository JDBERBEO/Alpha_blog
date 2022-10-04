class ArticlesController < ApplicationController
  def show 
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article]
    # whitelisting?? class 90
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
    #redirect_to article_path(@article)
    flash[:notice] = "Article was created successfully!"
    redirect_to @article
    else 
      render 'new'
    end
  end

end