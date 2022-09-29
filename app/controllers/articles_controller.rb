class ArticlesController < ApplicationController
  

  def create
    @article = Article.new(article_params)
    @article.group=Group.find(params[:group_id])
    @article.user= current_user
        respond_to do |format|
        if @article.save
            format.html { redirect_to user_group_article_path(current_user,@article.group,@article), notice: "Atricle was successfully created." }  
          else
            format.html { render :new, status: :unprocessable_entity }
          end       
        end 
  end

  def new
    @group = Group.find(params[:group_id])
    @article = Article.new
  end

  def destroy

  end

  def show

  end
  private
  def article_params
    params.require(:article).permit(:title,:description, :image)
end
end
