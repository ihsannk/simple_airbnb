get '/' do
  @property = Property.all
  #unless session[:user_id] == ""
  #@user = User.find_by(session[:user_id])
  erb :index
end

