#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client<ActiveRecord::Base
end
class Barber<ActiveRecord::Base
end
class Contact<ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
	@title = '22 - Barber Shop - Visit Us!'
	erb :visit
end

post '/visit' do
#saving form fields returned values to global variables
	@barber = params[:barber]
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@colour = params[:colour]

	c=Client.new
	c.name = @username
	c.phone = @phone
	c.datestamp = @datetime
	c.barber = @barber
	c.color = @colour
	c.save()

	erb "Dear #{@username}, we'll be waiting for you at #{@datetime}"
end