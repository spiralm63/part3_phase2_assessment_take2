get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

# starts a new session, routed FROM login.erb view
post '/sessions/new' do
  user = User.find_by_email(params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    erb :login
  end
end

# starts a new session, routed FROM signup.erb view
post '/sessions/newuser' do
  user = User.create(:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email], :password => params[:password])
  if user.save
    session[:user_id] = user.id
    redirect '/profile'
  else
    session[:error] = user.errors.full_messages
    erb :login
  end
end

get '/logout' do
  # session[:user_id] = nil
  session.delete(:user_id)

  redirect '/'
end

get '/profile' do
  erb :profile
end