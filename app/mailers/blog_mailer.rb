class BlogMailer < ApplicationMailer
  default from: 'from@example.com'

  def create_blog_email(blog)
    @blog = blog
    @url = 'https://calm-atoll-43337.herokuapp.com/'
    mail(to: blog.user.email, subject: '投稿しました')
  end

end
