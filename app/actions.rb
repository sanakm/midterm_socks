require 'pry'

helpers do

  def check_user
    @user = User.find_by(id: session[:user_id])
    if @user
      session.delete(:login_error)
    else
      session[:login_error] = "You must be logged in."
      redirect '/login'
    end
  end

  def is_employee?
    @user = User.find_by(id: session[:user_id])
    if @user.account_type
       session.delete(:login_error)
    else
      session[:login_error] = "You are not authorized to see this page"
      redirect '/login'
    end
  end

end

# TODO REMOVE ONCE EMPLPOYEE PAGES ARE CONSOLIDATED
get '/brian_employee' do
  erb :'employee/index_brian'
end

get '/' do
  erb :index
end

get '/register' do
  erb :'/customer/register'
end

get '/login' do
  erb :login
end

post '/login' do
  email = params[:email]
  password = params[:password]
  user = User.find_by(email: email, password_digest: password)
  if user
    session[:user_id] = user.id
    redirect '/customer/index'
  else
    session[:login_error] = "You must be logged in."
    redirect '/'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/customer' do
  erb :'customer/index_future'
end

get '/customer/checkout/:id' do
  session[:service_id] = params[:id].to_i
  erb :'customer/checkout'
end

post '/customer/checkout' do
  @fields = params
  @service_id = params[:service_id]
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password_digest: params[:password],
    address: params[:address],
    city: params[:city],
    postalcode: params[:postalcode],
    phone: params[:phone],
    services_id: session[:service_id]
  )
  if @user.save
    session[:user_id] = @user.id
    redirect '/customer/index'
  else
    redirect "/customer/checkout/#{session[:service_id]}"
  end
end

get '/customer/index' do
  check_user
  erb :'customer/index'
end

post '/customer/profile' do
  check_user
  user = User.find_by(id: session[:user_id])
  user.name = params[:name]
  user.email = params[:email]
  user.save
  redirect 'customer/index'
end


post '/customer/shipping' do
  check_user
  user = User.find_by(id: session[:user_id])
  user.address = params[:address]
  user.city = params[:city]
  user.postalcode = params[:postalcode]
  user.phone = params[:phone]
  user.save
  redirect 'customer/index'
end

post '/customer/order' do
  check_user
  user = User.find_by(id: session[:user_id])


  redirect 'customer/index'
end

post '/customer/compliment' do
  check_user
  user = User.find_by(id: session[:user_id])
  @result = params['orig']
  redirect 'customer/index'
end

post '/customer/complaint' do
  check_user
  user = User.find_by(id: session[:user_id])
  redirect 'customer/index'
end




get '/employee' do
  check_user && is_employee
  erb :'employee/index'
end

# get '/employee/compliments' do
#   check_user && is_employee
#   erb :'employee/compliments'
# end

# get '/employee/complaints' do
#   check_user && is_employee
#   erb :'employee/complaints'
# end

# get '/employee/orderhistory' do
#   check_user && is_employee
#   erb :'employee/orderhistory'
# end


# get '/employee/nextorders' do
#   check_user && is_employee
#   erb :'employee/nextorders'
# end


# get '/newuser' do
#   erb :newuser
# end

