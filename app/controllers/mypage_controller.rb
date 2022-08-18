class MypageController < ApplicationController
  # before_action :set_user, only: [:show]

  def show
    if params[:title].present?
      @articles = current_user.articles.where("title like ?", "%#{params[:title]}%").page(params[:page])
    else
      @articles = current_user.articles.page(params[:page])
    end
  end

  # private

  #   def set_user
  #     @user = current_user.articles.find(params[:id])
  #   end
end
