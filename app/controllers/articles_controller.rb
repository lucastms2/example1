class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
    def index
        
       @articles = Article.all  
        
        
    end
    
    
    
    def new
        
       @article  = Article.new()
        
    end
    
    def edit
        
        
        
        
    end
    
    
    def create 
       
     # render plain: params[:article].inspect
       
       @article = Article.new(article_params)
       
       if @article.save
           
           flash[:success] = "Article was sucessfully created"
           redirect_to article_path(@article)
       else
         render 'new' 
       end
    #@article = Article.create(article_params)
    
    
    
    end
    
    def destroy
      
       @article.destroy
       
       flash[:danger] = "Article was successfully destroy"
       
       redirect_to articles_path
        
    end
    
    def show 
       
       
    end
    
    def update
        
        
        if @article.update(article_params)
            flash[:success] = "Article was sucessfully update"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
        
        
    end
    
    
    private
    
        def set_article
            
            @article = Article.find(params[:id])
        end
        
        def article_params
            params.require(:article).permit(:title,:description)
        end
    
    
    
    
end