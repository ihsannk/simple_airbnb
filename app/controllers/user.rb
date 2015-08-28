get '/user/:id' do
  @user = User.find(session[:user_id])

  erb :user
end


