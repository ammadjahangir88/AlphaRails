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
  def join
    @group= Group.find(4)
    @join = @group.user_groups.build(:user_id => current_user.id)
    respond_to do |format|
      if @join.save
        format.html { redirect_to(group_path(@group), :notice => "You have joined this group.") }
        
      else
        format.html { redirect_to(group_path(@group), :notice => "You have alreadu joined this group.") }
        format.xml { render :xml => group_path(@group), :status => :unprocessable_entity }
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
