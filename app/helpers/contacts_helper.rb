module ContactsHelper
  def current_user
  @inform = current_user.email
  @current_user ||= User.find_by(id: session[:user_id])
end
end
