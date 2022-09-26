class ArticlesController < ApplicationController
  def index
    
  end

  def create
    @article = Article.new(article_params)
    @article.group=Group.find(2)
    @article.user= current_user
        respond_to do |format|
        if @article.save
            format.html { redirect_to article_path(@article), notice: "Atricle was successfully created." }  
          else
            format.html { render :new, status: :unprocessable_entity }
          end       
        end 
  end

  def new
    @article = Article.new
  end

  def destroy
  end
  private
  def article_params
    params.require(:article).permit(:title,:description, :image)
end
end
