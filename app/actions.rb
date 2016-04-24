require 'pry'
require 'bcrypt'

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
      # binding.pry
     session.delete(:login_error)
   else
    session[:login_error] = "You are not authorized to see this page"
    redirect '/login'
    end
  end

end

# TODO REMOVE ONCE EMPLPOYEE PAGES ARE CONSOLIDATED
# get '/brian_employee' do
#   check_user && is_employee
#   erb :'employee/index_brian'
# end

get '/brian_employee' do
  check_user && is_employee?
  @compliments = Comment.where(feedback: "compliment").order(created_at: :desc)
  @complaints = Comment.where(feedback: "complaint").order(created_at: :desc)
  erb :'employee/index_brian'
end
#COMMENTS

# get '/brian_employee' do
#   check_user && is_employee
#   @orders = Order.all
#   erb :'employee/index_brian'
# end
#ORDERS

# TODO customer_comments

get '/' do
  @customer_names = ["~Anon", "~Anon", "~Anon"]
  @customer_comments = ["This is bound to change everything", "Okay, I need to up my subscription. Stupid gnomes...", "I love the socks!"]

  #TODO Refactor this block, make it as a helper.
  @results_compliments = Comment.where(feedback: "compliment")
  @compliments_array = []
  @results_compliments.each do |compliment|
    @compliments_array.push(compliment)
  end

  if @results_compliments.length > 2
    #pull random compliments
    # TODO problem with compliments - bug where names doesn't match compliment.
    @random = rand(@compliments_array.length - 1)
    @compliment1 = @compliments_array[@random]
    @compliments_array.delete_at(@random)
    @random = rand(@compliments_array.length - 1)
    @compliment2 =  @compliments_array[@random]
    @compliments_array.delete_at(@random)
    @random = rand(@compliments_array.length - 1)
    @compliment3 =  @compliments_array[@random]

    @customer_names[0] = User.find_by(id: @compliment1.users_id).name unless User.find_by(id: @compliment1.users_id).nil?
    @customer_names[1] = User.find_by(id: @compliment2.users_id).name unless User.find_by(id: @compliment2.users_id).nil?
    @customer_names[2] = User.find_by(id: @compliment3.users_id).name unless User.find_by(id: @compliment2.users_id).nil?

    @customer_comments[0] = @compliment1.description
    @customer_comments[1] = @compliment2.description
    @customer_comments[2] = @compliment3.description


  elsif @results_compliments.length == 2
    @customer_names[0] = User.find_by(id: @all_compliments[0].users_id).name unless User.find_by(id: @all_compliments[0].users_id).nil?
    @customer_names[1] = User.find_by(id: @all_compliments[1].users_id).name unless User.find_by(id: @all_compliments[1].users_id).nil?

    @customer_comments[0] = @all_compliments[0].description
    @customer_comments[1] = @all_compliments[1].description


  elsif @results_compliments.length == 1
    @customer_names[0] = User.find_by(id: @all_compliments[0].users_id).name unless User.find_by(id: @all_compliments[0].users_id).nil?
    @customer_comments[0] = @all_compliments[0].description
  end

  erb :index
end


get '/login' do
  erb :login
end

post '/login' do
  email = params[:email]
  password = params[:password]
  user = User.find_by(email: email, password_digest: password)
  # binding.pry
  if user
    session[:user_id] = user.id
    if user.account_type
      redirect '/brian_employee'
    else
      redirect '/customer/index'
    end
  else
    session[:login_error] = "The email or password you've entered doesn't match any account."
    redirect '/login'
  end
end

get '/home' do
  redirect '/logout'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
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
  @user = User.find_by(id: session[:user_id])
  @order = Order.where(users_id: @user.id)
  @subscription = []
  @order.each do |i|
    order_date = i.order_made
    order_title = Service.find_by(id: i.id).name
    order_socks = Service.find_by(id: i.id).socks_per_month
    order_cost = Service.find_by(id: i.id).cost
    @subscription.push({:date => order_date, :title => order_title, :socks => order_socks, :cost => order_cost})
  end

  erb :'customer'
end

post '/customer/profile' do
  check_user
  user = User.find_by(id: session[:user_id])
  user.name = params[:name]
  user.email = params[:email]
  user.save
  redirect '/customer/index'
end

post '/customer/shipping' do
  check_user
  user = User.find_by(id: session[:user_id])
  user.address = params[:address]
  user.city = params[:city]
  user.postalcode = params[:postalcode]
  user.phone = params[:phone]
  user.save
  redirect '/customer/index'
end

post '/customer/change_order' do
  check_user
  user = User.find_by(id: session[:user_id])
  a = params[:order]
  case a
  when "1"
    user.services_id = a.to_i
  when "2"
    user.services_id = a.to_i
  when "3"
    user.services_id = a.to_i
  when "4"
    user.services_id = a.to_i
  end
  redirect '/customer/index'
end

post '/customer/compliment' do
  check_user
  user = User.find_by(id: session[:user_id])
  comment = Comment.new(description: params['orig'], feedback: "compliment", users_id: session[:user_id])
  comment.save
  redirect 'customer/index'
end

post '/customer/complaint' do
  check_user
  user = User.find_by(id: session[:user_id])
  complaint = Comment.new(description: params['orig'], feedback: "complaint", users_id: session[:user_id])
  complaint.save
  redirect 'customer/index'
end


# get '/employee' do
#   check_user && is_employee
#   erb :'employee/index'
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
