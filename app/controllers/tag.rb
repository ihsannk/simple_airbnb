get '/tag' do
@property = Property.find_by(params[:tag])
erb :tag
end