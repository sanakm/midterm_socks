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
user = User.where(email: params[:email]).where(password: params[:password]).first
if user && user[:password] == params[:password]
  session[:user_id] = user[:id]
  redirect '/customers'
end
redirect '/'
end

get '/customers/checkout' do
  @services = Service.all
  erb :'customers/checkout'
end

post '/customers/checkout' do
  if params[:email] == "" || params[:password] == "" || params[:password_confirmation] == ""
   redirect '/customers/checkout'
 elsif params[:password] == params[:password_confirmation] 
   user = User.create(
     name: params[:name],
     email: params[:email],
     phone: params[:phone],
     password: params[:password],
     address: params[:address],
     city: params[:city],
     postalcode: params[:postalcode],
     )
   user.save
   session[:user_id] = user.id
   redirect '/customers/customers'
 end
end

get '/customers' do
  erb :'customers/index'
end

# get '/customers/comments' do
#   erb :'customers/new'
# end

# post 'customers/comments' do
#   erb :'customers/new'
# end



get '/logout'do
  session[:user_id] = nil
  redirect '/' 
end

get '/customers/pay' do
  check_user
  @services = Service.all
  erb :'customers/pay'
end

# get '/newuser' do
#   erb :newuser
# end

