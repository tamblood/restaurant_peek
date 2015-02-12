get '/' do
  session[:user_id] = 1 
  @user_id = session[:user_id] 
  @user = User.find(@user_id) 
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
  content_type :json
  server_data = {user: @user, restaurant: @restaurant}.to_json
end


# routes for ajax
get '/getspecial' do
  @restaurant_name = params[:restaurant_name]
  @restaurant = Restaurant.find_by_name(@restaurant_name)
  @restaurant.get_special
end

get '/sendtext' do
  restaurant_special = params[:restaurant_special]
  @user_id = session[:user_id] 
  @user = User.find(@user_id) 
  @user.sendtext(restaurant_special)
end
