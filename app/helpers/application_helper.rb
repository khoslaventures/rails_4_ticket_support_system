module ApplicationHelper
  def support_avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}.png?s=65&r=pg"
  end
end
