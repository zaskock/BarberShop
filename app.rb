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

	c=Client.new params[:client]
	c.save

	erb "Dear #{@username}, we'll be waiting for you at #{@datetime}"
end