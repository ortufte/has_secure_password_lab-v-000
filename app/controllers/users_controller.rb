class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new
        if params[:user][:password] == params[:user][:password_confirmation] 
            @user.name = params[:user][:name]
            @user.password = params[:user][:password]
            @user.password_confirmation = params[:user][:password_confirmation]
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end



    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end