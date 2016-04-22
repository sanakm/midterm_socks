require 'pry'
use Rack::MethodOverride
# Homepage (Root path)
helpers do

  # Get logged-in user or redirects to login page
  # Uses session[:login_error] to store an error message when needed
  def check_user
    @user = User.find_by(id: session[:user_id])
    if @user
      session.delete(:login_error)
    else
      session[:login_error] = "You must be logged in."
      redirect '/login'
    end
  end

end

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login'do
  email = params[:email]
  password = params[:password]
  #binding.pry
  user = User.find_by(email: email, password_digest: password)
  #binding.pry
  if user
    session[:user_id] = user.id
    redirect '/customer/index'
  else
    session[:login_error] = "You must be logged in."
    redirect '/'
  end
end

get '/logout'do
  session[:user_id] = nil
  redirect '/' 
end


get '/customer/checkout/:id' do
  #binding.pry
  session[:service_id] = params[:id].to_i
  #binding.pry
  #@services_id = params[:id].to_i
  erb :'customer/checkout'
end

post '/customer/checkout' do
  #binding.pry
  session[:name] = params[:name]
  session[:email] = params[:email]
  session[:password] = params[:password]
  if params[:password] == params[:password_confirmation] 
    redirect '/customer/checkout2'
  end 

end

get '/customer/checkout2' do
  #binding.pry
  erb :'customer/checkout2'

end

post '/customer/checkout2' do
  session[:phone] = params[:phone]
  session[:address] = params[:address]
  session[:city] = params[:city]
  session[:postalcode] = params[:postalcode]
    redirect '/customer/checkout3'
  end 

  get '/customer/checkout3' do
    erb :'customer/checkout3'
  end

 post '/customer/checkout3' do
    user = User.create(
      name: session[:name],
      email: session[:email],
      phone: session[:phone],
      password: session[:password],
      address: session[:address],
      city: session[:city],
      postalcode: session[:postalcode],
      services_id: session[:service_id]
      )
    user.save
    session[:user_id] = user.id
    redirect '/customer/index'
  end


get '/customer/index' do
  check_user
  erb :'customer/index'
end

post '/customer/index' do
  check_user
  erb :'customer/index'
end

get '/customer/profile' do
  check_user
  erb :'customer/profile'
end

post '/customer/profile' do
  #check_user
  user = User.find_by(id: session[:user_id])
  user.name = params[:name]
  user.email = params[:email]
  #binding.pry
  user.save
  redirect 'customer/index'
end

# get '/customer/shipping' do
#   check_user
#   erb :'customer/shipping'
# end

post '/customer/shipping' do
  check_user

end




# get '/customer/comments' do
#   erb :'customer/new'
# end

# post 'customer/comments' do
#   erb :'customer/new'
# end

# get '/newuser' do
#   erb :newuser
# end

