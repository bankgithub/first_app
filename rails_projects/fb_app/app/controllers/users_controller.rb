class UsersController < ApplicationController
  def show
    @user = current_user;
  end
  def new
    @user = User.new
  end
    def index
    @user = User.all
	end
	 def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
   end
  def timeline
        @user = current_user
        @status = Status.find_by_sql "SELECT * FROM statuses s WHERE s.belong = :belong ORDER BY s.id DESC", {:belong => @user.id }
  end
  def timelinepost
    @user = current_user;
    @status = Status.new(status_params);
    if @status.save
      flash[:success] = "New Status created!"
      redirect_to users_timeline_path;
    end

  end
  def alltimeline
    @user = current_user;
    @status = Status.find_by_sql "SELECT * FROM statuses s JOIN users u ON u.id=s.belong  ORDER BY s.id DESC";
  end

  def alltimelinepost
    @user = current_user;
    @status = Status.new(status_params);
    if @status.save
      flash[:success] = "New Status created!"
      redirect_to users_alltimeline_path;
    end
  end

  private

  def user_params
    params.require(:signup).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  def status_params
    params.require(:post).permit(:text, :belong)
  end
end
