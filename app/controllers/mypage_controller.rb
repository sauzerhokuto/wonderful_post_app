class MypageController < ApplicationController
  # before_action :set_user, only: [:show]

  def show
    @articles = current_user.articles
  end

  # private

  #   def set_user
  #     @user = current_user.articles.find(params[:id])
  #   end
end
