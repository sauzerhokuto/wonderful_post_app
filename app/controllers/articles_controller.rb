class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_article, only: %i[ edit update destroy ]

  # GET /articles or /articles.json
  def index
    if params[:title].present?
      @articles = Article.where("title like ?", "%#{params[:title]}%").page(params[:page])
    else
      @articles = Article.all.page(params[:page])
    end
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    # binding.pry
    @article = current_user.articles.new(article_params)
    respond_to do |format|
      # binding.pry
      if @article.save
        format.html { redirect_to article_url(@article), notice: "#{t('activerecord.models.article')}を作成しました。" }
      # format.json { render :show, status: :created, location: @article }
       else
        ormat.html { render :new, status: :unprocessable_entity }
      # format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      binding.pry
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "#{t('activerecord.models.article')}を編集しました。" }
        # format.json { render :show, status: :ok, location: @article }
        binding.pry
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: "#{t('activerecord.models.article')}を削除しました。" }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content, tag_ids:[])
      #tag_ids:[]　は外部キーのこと。[]を使っているのは
      #複数の外部キーが渡ってくるから配列で表示させるため。
    end
end
