get '/login' do
  erb :login
end

post '/login' do

  input_email = params[:input_email]
  input_password = params[:input_password]

  user = User.authenticate(input_email, input_password)

  if user
    session[:user_id] = user.id
    path = "/user/:id"
  else
    path = "/login"
  end

  redirect to path
end