post '/property' do

input_property_name = params[:input_property_name]
input_description = params[:input_description]
input_price = params[:input_price]
input_tag = params[:input_tag]
input_user_id = session[:input_user]

#@user = @property.users.create(user_id: input_user_id)

new_property = Property.new(property_name: input_property_name, description: input_description, price: input_price)
new_tag = Tag.slice_tag(input_tag)

  if new_property.save

    new_tag.each do |t|
      new_property.tags << t
    end

  path = "/property/#{new_property.id}"
  end
  session[:property_id] = new_property.id
  redirect to path
end

get "/property/:id" do
 @property = Property.find(params[:id])
 erb :property
end