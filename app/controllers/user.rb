get '/user/:id' do
  @user = User.find(session[:user_id])
  erb :user
end

get '/logout' do
  session.clear
  erb :index
end

