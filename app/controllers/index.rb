get '/' do
  erb :index	
end

get '/users/:user_id' do
  @user = User.find(params[:user_id])
  @user_id = params[:user_id]
  erb :user
end

get '/users/:user_id/restaurants' do
  @user_id = params[:user_id]
  @user = User.find(@user_id)
  erb :restaurants
end

get '/users/:user_id/restaurants/:restaurant_id' do
  @user_id = params[:user_id]
  @user = User.find(@user_id)
  @restaurant_id = params[:restaurant_id]
  @restaurant = Restaurant.find(@restaurant_id)
  erb :specific_restaurant
end

get '/users/:user_id/restaurants/:restaurant_id/specials' do
  @user_id = params[:user_id]
  @user = User.find(@user_id)
  @restaurant_id = params[:restaurant_id]
  @restaurant = Restaurant.find(@restaurant_id)
  @special = @restaurant.get_special
  erb :specials
  
end

get '/users/:user_id/restaurants/:restaurant_id/sendtext' do
  @user_id = params[:user_id]
  @user = User.find(@user_id)
  @restaurant_id = params[:restaurant_id]
  @restaurant = Restaurant.find(@restaurant_id)
  @user.sendtext(@restaurant.special)
  erb :restaurants
end