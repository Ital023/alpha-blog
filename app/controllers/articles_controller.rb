class ArticlesController < ApplicationController

  before_action :get_article, only: [:show, :edit, :update, :destroy]

  def show

  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    
  end

  def create
    @article = Article.new(articles_params)
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to article_path(@article)
    else
      render "new"
    end
  end

  def update
    if @article.update(articles_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article id #{@article.id} has been deleted"
    redirect_to articles_path
  end

  private
  def articles_params
    params.require(:article).permit(:title, :description)
  end
  def get_article
    @article = Article.find(params[:id])
  end

end
