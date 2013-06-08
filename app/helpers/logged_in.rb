def current_user
  if session[:user]
    @current_user ||= User.find(session[:user])
  end
end

def logged_in?
  !current_user.nil?
end
