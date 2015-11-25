require 'sinatra'
require 'sinatra/reloader'
require 'uri'
require 'pry'
require_relative('./lib/post.rb')
require_relative('./lib/blog.rb')
require_relative('./lib/user.rb')

enable(:sessions)

blog = Blog.new
message = ""

get '/' do
	redirect('/new_post')
end	

get '/new_post' do
	erb :new_post, layout: :sinatra_layout
end

post '/new_post' do
 	post = Post.new(params[:title], params[:text])
 	blog.add_post(post)
 	redirect('/posts')
end

get '/posts' do
	@posts = blog.latest_posts
	erb :posts, layout: :sinatra_layout
end

post '/posts' do
	posts_to_delete = params.keys	
	posts_to_delete.each do |id|
		blog.delete_post(id)
	end	
	redirect ('posts')
end	

get '/post_details/:id' do
  @post = blog.find_post_by_id(params[:id])
  erb :post_details, layout: :sinatra_layout
end

get "/login" do
	erb :login,layout: :sinatra_layout
end

post '/login' do
  	user = User.new(params[:username], params[:password])
  	valid_user = User.valid_credentials? user
  	if valid_user
    	session[:user] = user.name
    	message = "Welcome, #{user.name}!"    
  	else
  		message = "Wrong credentials"    
  	end
  	redirect("/profile")
end


get '/profile' do
	@message = message
 	erb :profile, layout: :sinatra_layout
end


get '/logout' do
 	session[:user] = nil
 	redirect("/login")
end