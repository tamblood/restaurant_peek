get '/' do
  erb :index	
end

get '/users/:user_id' do
  @user_id = params[:user_id]
  erb :user
end

get '/users/:user_id/restaurants' do
  @user_id = params[:user_id]
  @user = User.find(@user_id)
  erb :restaurants
end

get '/users/:user_id/sendtext' do
  @user_id = params[:user_id]
  @user = User.find(@user_id)
  restaurant = @user.restaurants.first
  @user.sendtext(restaurant.special)
  redirect to '/'
end