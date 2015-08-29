class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only:[:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
<<<<<<< HEAD
      flash[:info] = "Η εγγραφή έγινε με επιτυχία. Ελέγξτε το η-ταχυδρομείο σας για επαλήθευση."
=======
      flash[:info] = "Ελέγξτε το ηλεκτρονικό σας ταχυδρομείο."
>>>>>>> 33d0173cfd79df6567b76997b2b01b34b8f68d70
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Ο λογαριασμός έχει ανανεωθεί."
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Ο χρήστης διαγράφηκε"
    redirect_to users_url
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
  
  # Before filters
  
<<<<<<< HEAD
  
=======
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Παρακαλώ συνδεθείτε."
      redirect_to login_url
    end
  end

>>>>>>> 33d0173cfd79df6567b76997b2b01b34b8f68d70
  # Confirms the correct user
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

<<<<<<< HEAD
=======
  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
>>>>>>> 33d0173cfd79df6567b76997b2b01b34b8f68d70

end
