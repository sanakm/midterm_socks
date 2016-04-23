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
  check_user && is_employee
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
  user = User.find_by(email: email)
  if user
    if user.authenticate(password)
      session[:user_id] = user.id
      if user.account_type
        redirect '/brian_employee'
      else
        redirect '/customer'
      end
    else
      session[:login_error] = "The password you've entered is incorrect."
      redirect '/login'
    end
  else
    session[:login_error] = "The email or password you've entered doesn't match any account."
    redirect '/login'
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
    #services_id: session[:service_id]
    )
  if @user.save
    session[:user_id] = @user.id
    redirect '/customer/index'
  else
    erb :'/customer/checkout'
  end
end

get '/customer/index' do
  check_user
  erb :'customer/index'
end

post '/customer/index' do
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

get '/customer/shipping' do
  check_user
  erb :'customer/shipping'
end

post '/customer/shipping' do
  check_user
  user = User.find_by(id: session[:user_id])
  user.address = params[:address]
  user.city = params[:city]
  user.postalcode = params[:postalcode]
  user.phone = params[:phone]
  user.save
end

get '/customer/order' do
  check_user
end

# get '/employee' do
#   check_user && is_employee
#   erb :'employee/index'
# end

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

# get '/customer/comments' do
#   erb :'customer/new'
# end

# post 'customer/comments' do
#   erb :'customer/new'
# end

# get '/newuser' do
#   erb :newuser
# end