require 'pry'

class Post

	@@current_id = 1
 	attr_reader :title, :date, :text, :id

 	def initialize(title, text)
 		@title = title
   		@date = Time.now.strftime("%d/%m/%Y %H:%M") 
 		@text = text
 		@id = @@current_id
    	@@current_id += 1
 	end	

 	def pretty_print
 		"Title: #{@title}<br>Text: #{@text}<br>Date: #{@date}"
 	end	
end 	

