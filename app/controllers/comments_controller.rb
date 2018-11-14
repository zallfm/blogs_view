class CommentsController < ApplicationController

	http_basic_authenticate_with name: "user", password: "user", only: :destroy
    
    #to create comment from database
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
