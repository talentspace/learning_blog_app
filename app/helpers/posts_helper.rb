module PostsHelper
  def formatted_date(post)
    post.created_at.strftime('%e %b %Y')
  end
end
