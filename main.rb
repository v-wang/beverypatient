require 'sinatra'
require 'mandrill'  



get '/profile' do 
	erb :profile
end

get '/about' do
	erb :about
end

get '/home' do
	erb :home
end



	def send_message(from, body)
		puts "Thank you for the feedback!"
		m = Mandrill::API.new
		message = {
			:subject=> "New Message Received",
			:from_name=> "Saamahn Mahjouri",
			:text=>body,
		:to=>[
			{
			:email=>"mahjouri.saamahn@gmail.com",
			:name=>"Saamahn Mahjouri"
			}
		],
		:html=>"<html><h1>Thanks <strong>message</strong> how are you?</h1></html>",
		:from_email=>from
		}
		sending = m.messages.send message
		puts sending
		end


	get '/contact' do
		@title = "Contact Page"
		erb :contact
	end

	post '/response' do
		@title = "Feedback Page"
		send_message("mahjouri.saamahn@gmail.com","Hi there!")
		erb :response
		# redirect to("/contact")
	end


	