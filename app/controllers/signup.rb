get '/signup' do
  erb :signup
end

post '/signup' do
  path = "/"

  input_fullname = params[:input_fullname]
  input_email = params[:input_email]
  input_password = params[:input_password]
  input_confirm_password = params[:input_confirm_password]

  if input_password == input_confirm_password
    new_user = User.new(fullname: input_fullname, email: input_email, password: input_password)
    if new_user.valid? && new_user.save
      session[:user_id] = new_user.id
      path = "/user/id"
    else
      #error message
      path = "/signup"
    end
  else
    #error message session[:err_msg] = "Password does not match."
     path = "/signup"
  end

  redirect to path
end