class ArticlesController <ApplicationController
    def show
      @article = Article.find(params[:id])  
      @articles = Article.all
    end

end