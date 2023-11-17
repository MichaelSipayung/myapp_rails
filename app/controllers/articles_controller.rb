class ArticlesController < ApplicationController
  def index #action index
    @articles = Article.all #get all article
    # @article is a controller instance variable that is available in the view
  end
  def show #action show, with an extra parameter :id
    @article = Article.find(params[:id])
  end
  def new #action new, instantiate a new article
    @article = Article.new
  end
  def create #action create,
    @article  = Article.new(article_params) #create new article, with dummy value
    if @article.save #save article
      redirect_to @article #redirect to article, make new request
    else
      render :new, status: :unprocessable_entity #render specific view,
      #with status unprocessable_entity
    end
  end
  def edit #action edit, fecch article by id, and store in @article
    @article = Article.find(params[:id])
  end
  def update #action update
    @article = Article.find(params[:id])
    if @article.update(article_params)  #update article
      redirect_to @article #redirect to article, make new request
    else #if update failed, render specific view , /articles/:id/edit
      render :edit, status: :unprocessable_entity #render specific view
    end
  end
  def destroy #action destroy
    @article = Article.find(params[:id])
    @article.destroy #destroy article
    redirect_to root_path status: :see_other #redirect to root_path, make new request
  end
  private
    def article_params #private method article_params to permit title and body
      params.require(:article).permit(:title, :body)
    end
end
