class ArticlesController < ApplicationController
	
    http_basic_authenticate_with name: "user", password: "user", except: [:index, :show]
 
    #for view all database from create
	def index
        @articles = Article.all
    end
    
    #show the result from database
	def show
        @article = Article.find(params[:id])
    end
    
    #make new post
	def new
        @article = Article.new
    end
    
    #used to change data
    def edit
        @article = Article.find(params[:id])
    end
 
    #handle for request from database
    def create
        @article = Article.new(article_params)
 
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    
    #to update data after editing
    def update
        @article = Article.find(params[:id])
 
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    #to deleted data from database
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
     
      redirect_to articles_path
    end
 
 private
    def article_params
        params.require(:article).permit(:title, :text)
    end
 end
