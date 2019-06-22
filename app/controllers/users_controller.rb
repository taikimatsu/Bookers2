class UsersController < ApplicationController
before_action :authenticate_user!
before_action :check, only:[:update, :edit]
	def show
		@user = User.find(params[:id])
		@books = @user.books.page(params[:page]).reverse_order
		@book = Book.new
	end

	def index
		@user = User.find(current_user.id)
		@users = User.all
		@book = Book.new

	end

	def edit
		@user = User.find(current_user.id)

	end

	def update
		@user = User.find(current_user.id)
		if @user.update(user_params)
			flash[:notice] = "You have updated user successfully."
		redirect_to user_path(@user)
	    else render :edit
	    end
	end


	private
    def user_params
        params.require(:user).permit(:title, :body, :name, :introduction, :profile_image)
    end
    def check
	user = User.find(params[:id])
		if current_user != user
			redirect_to user_path(current_user)
		end
	end





end
