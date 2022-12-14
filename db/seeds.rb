# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ユーザーが3つ作られるようにする
# メールアドレス: "user001@test.com"
# 「001」の部分は、2人目は「002」、3人目は「003」にする。
# パスワード: "test1234"

3.times do |n|
  User.create!(
    email: "user00#{n+1}@test.com",
    password:  "test1234" )
end

50.times do |n|
  user = User.first
  article = user.articles.create!(
    title: "No.#{n+1}: user001の記事",
    content: "No.#{n+1}: user001の記事の本文")
    # article.tags.create!(name:"プログラミング")
end

50.times do |n|
  user = User.second
  user.articles.create!(
    title: "No.#{n+1}: user002の記事",
    content: "No.#{n+1}: user002の記事の本文" )
end

50.times do |n|
  user = User.third
  user.articles.create!(
    title: "No.#{n+1}: user003の記事",
    content: "No.#{n+1}: user003の記事の本文" )
end

Article.all.ids.sort.each do |article_id|
  #Articleの全てのidをeachで取得する
  #idsは主キーのカラムデータを配列で取得するメソッド
  #sortは並び替えるメソッド
  Tag.all.ids.sort.each do |tag_id|
    ArticleTag.find_or_create_by!(article_id: article_id, tag_id: tag_id)
    #eachで送られてきたidを基に中間テーブルで外部キーを作成
  end
end



#danofさんの解答例↓
# user001 = User.create!(email: "user001@test.com", password:  "test1234")
# user002 = User.create!(email: "user002@test.com", password:  "test1234")
# user003 = User.create!(email: "user003@test.com", password:  "test1234")

# 50.times do |n|
#   user001.articles.create!(title: "No.#{n+1}: user001の記事", content: "No.#{n+1}: user001の記事の本文")
# end

# 50.times do |n|
#   user002.articles.create!(title: "No.#{n+1}: user002の記事", content: "No.#{n+1}: user002の記事の本文")
# end

# 50.times do |n|
#   user003.articles.create!(title: "No.#{n+1}: user003の記事", content: "No.#{n+1}: user003の記事の本文")
# end
