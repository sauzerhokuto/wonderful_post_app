class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:show]
  # def create
  #   @user = User.new(user_params) # 何を新しく保存するか指定
  #   @user.user_id = current_user.id # 誰が投稿したかを指定
  #   if @user.save # もし保存ができたら
  #    redirect_to new_user_session  # 投稿画面に遷移
  #   else  # できなければ
  #    render :new  # newに遷移
  #   end
  # end

  # def new
  #  @user = User.new
  #  @users = User.all
  # end

  # private  # ストロングパラメーター（予期しない値を変更されてしまう脆弱性を防ぐ機能）
  # def user_params
  #  params.require(:user).permit(:title, :content)  # titleとbodyの変更を許可
  # end
end
