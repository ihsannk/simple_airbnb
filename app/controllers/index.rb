get '/' do
  @property = Property.order(created_at: :desc)
  erb :index
end

get '/logout' do
 session.clear
end

