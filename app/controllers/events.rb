get '/events/new' do
  erb :events_new
end

post '/events' do
  current_user.created_events.create(params[:event])

  redirect '/profile'
end


get '/events/:id' do
  @event = Event.find(params[:id])

  erb :events_show
end

get '/events/:id/edit' do
  @event = Event.find(params[:id])

  erb :events_edit
end

put '/events/:id' do
  @event = Event.find(params[:id])
  @event.update_attributes(params[:event])

  redirect '/profile'
end

delete '/events/:id' do
  @event = Event.find(params[:id])
  @event.destroy

  redirect '/profile'
end