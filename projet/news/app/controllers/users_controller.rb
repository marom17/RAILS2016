class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :reset_password]
  before_filter :authenticate_user!
  
  
  def reset_password
	authorize! :reset_password, @user
  
	@random_password = ('0'..'z').to_a.shuffle.first(8).join
	
	@user.reset_password!(@random_password, @random_password)
  end

  # GET /users
  # GET /users.json
  def index
	authorize! :manage, @user
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
	authorize! :manage, @user
  end

  # GET /users/new
  def new
	authorize! :manage, @user
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
	authorize! :manage, @user
	
	# user_params[:role] = "author"
    #@user = User.new(user_params)
	#st = ActiveRecord::Base.connection.raw_connection.prepare("INSERT INTO users (firstname, lastname, created_at, updated_at, email, medium_id, role) VALUES (?, ?, NOW(), NOW(), ?, ?, ?)")
	#st.execute(user_params[:medium_id], user_params[:role], user_params[:email], user_params[:medium_id], user_params[:role])
	#st.close
	
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
	authorize! :manage, @user
  
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
	authorize! :manage, @user
  
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :medium_id, :role, :password)
    end
end
