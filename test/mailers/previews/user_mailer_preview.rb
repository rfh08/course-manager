# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/to_webmaster
  def to_webmaster
    @post = Post.last
    UserMailer.to_webmaster(@post)
  end

end
