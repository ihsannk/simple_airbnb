get '/property/:id/book' do
  @property = Property.find(params[:id])
  erb :booking
end

post '/property/:id/book' do
  @property = Property.find(params[:id])

  erb :booking
end