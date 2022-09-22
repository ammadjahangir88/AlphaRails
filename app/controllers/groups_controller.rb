class GroupsController < ApplicationController
  def index
    @group=Group.all
  end

  def show
    @group= Group.find(params[:id])
  end


  def new

    @group=Group.new

  end


  def create

    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        # session[:user_id] = @user.id
        format.html { redirect_to @group, notice: "Welcome to Alphablog " }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end

  end

 

  def destroy

  end
  private
  def group_params
    params.require(:group).permit(:name,:grouptype)
end
end
