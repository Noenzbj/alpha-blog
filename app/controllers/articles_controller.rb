class ArticlesController <ApplicationController
  before_action :set_article, only: [:show, :edit, :destroy, :update]

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
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was successfully created!"
      render 'new'
    else
      render "new"
    end
  end

  def update 
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Updated successfully"
      redirect_to @article
    else 
      render "edit" 
    end
  end

  def destroy
    if @article.destroy
      redirect_to articles_path
    end
  end

  private
    
  def set_article
    @article = Article.find(params[:id])
  end
end