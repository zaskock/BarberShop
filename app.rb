#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client<ActiveRecord::Base

	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :barber, presence: true
	validates :color, presence: true

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

	erb "Dear #{c[:name]}, we'll be waiting for you at #{c[:datestamp]}"
end