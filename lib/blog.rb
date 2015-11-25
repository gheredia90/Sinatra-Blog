require 'pry'

class Blog	
 	attr_accessor :posts

 	def initialize
 		@posts = []
 	end	
 	
 	def add_post(post)
 		@posts.push(post)
 	end

 	def latest_posts
 		@posts.reverse
 	end	

 	def delete_post(id)
  		@posts.delete_if{|post| post.id == id.to_i}
 	end

 	def find_post_by_id(id)
  		posty = @posts.find{|post| post.id == id.to_i}
  		posty.nil? ? nil : posty
  	end
end