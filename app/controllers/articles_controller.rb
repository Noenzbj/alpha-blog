class ArticlesController <ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show  
  end

  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @article = Article.new
  end

  def edit     
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.user = current_user
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
  
  def require_same_user
    if current_user != @article.user
      flash[:alert]="This is not your article!"
      redirect_to @article
    end

  end
end