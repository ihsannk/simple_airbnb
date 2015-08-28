get '/tag/:tag' do
  @tag = Tag.find_by(tag: params[:tag])
  erb :tag
end