get '/' do
  @property = Property.order(created_at: :desc)
  erb :index
end

get '/tag/:tag' do
  @tag = Tag.find_by(tag: params[:tag])
  erb :tag
end