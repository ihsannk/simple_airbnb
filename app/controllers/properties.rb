post '/property' do
  user = User.find(session[:user_id])

  input_property_name = params[:input_property_name]
  input_description = params[:input_description]
  input_price = params[:input_price]
  input_tag = params[:input_tag]
  # input_user_id = session[:input_user]
  # @user = @property.users.create(user_id: input_user_id)

  new_property = user.properties.new(property_name: input_property_name, description: input_description, price: input_price)
  new_property.save

  tag_array = input_tag.gsub(/\s+/, "").gsub(/^,*|(?<=,),|,*$/, "").split(",")

  tag_array.each do |t|
    tag = Tag.find_or_create_by(tag: t)
    new_property.tags << tag
  end


  session[:property_id] = new_property.id
  path = "/property/#{new_property.id}"

  redirect to path
end

get "/property/:id" do
  @property = Property.find(params[:id])
  session[:property_id] = @property.id
  erb :property
end

get "property/:id/edit" do
  @edit_property = Property.find(session[:property_id])
  erb :edit
end

post "property/:id/edit" do
  @edit_property = Property.find(params[:id])
  redirect to "/property/id"
end

get "/property/:id/delete" do
  @delete_property = Property.find(params[:id])
  @delete_property.destroy
  erb :index
end



