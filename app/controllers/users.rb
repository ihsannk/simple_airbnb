get '/signup' do
  @error = ""
  if session[:error] != nil
    @error = session[:error]
    session[:error] = nil
  end
  erb :signup
end

post '/signup' do
  input_fullname = params[:input_fullname]
  input_email = params[:input_email]
  input_password = params[:input_password]
  input_confirm_password = params[:input_confirm_password]

  if input_password == input_confirm_password
    new_user = User.new(fullname: input_fullname, email: input_email, password: input_password)
    if new_user.valid? && new_user.save
      session[:user_id] = new_user.id
      path = "/user/#{new_user.id}"
    else
      session[:error] = "input error"
      path = "/signup"
    end
  else
    session[:error] = "wrong password confirmation, please start over"
    path = "/signup"
  end
  redirect to path
end

get '/login' do
  @error = ""
  if session[:error] != nil
    @error = session[:error]
    session[:error] = nil
  end
  erb :login
end

post '/login' do
  input_email = params[:input_email]
  input_password = params[:input_password]

  user = User.authenticate(input_email, input_password)

  if user
    session[:user_id] = user.id
    path = "/user/#{user.id}"
  else
    session[:error] = "wrong email or password"
    path = "/login"
  end

  redirect to path
end

get '/user/:id' do
  @user = User.find(session[:user_id])
  erb :user
end

post '/user/:id' do
  @user = User.find(session[:user_id])

  input_fullname = params[:input_fullname]
  input_email = params[:input_email]

  @user.update(fullname: input_fullname, email: input_email)

  redirect to "/user/#{@user.id}"

end

get '/logout' do
  session[:user_id] = nil
  erb :login
end
