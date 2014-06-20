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
		m = Mandrill::API.new
		message = {
			:subject=> "Contact Form",
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
		send_message("default@default.com","Thanks for the feedback!")
		erb :response
		redirect to('/profile')
	end
	