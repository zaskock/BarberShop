#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client<ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 3}
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
	@title = 'Barber Shop - Visit Us!'
	@c=Client.new
	erb :visit
	
end

post '/visit' do

	@c=Client.new params[:client]

	if @c.save
		erb "Dear #{@c[:name]}, we'll be waiting for you at #{@c[:datestamp]}"
	else
		@error = @c.errors.full_messages.first
		erb "An error occurred, the record has not been saved to database!"
		erb :visit
	end

	end

get '/barber/:id' do
	@barber= Barber.find (params[:id])
	erb :barber
end

get '/appointments' do
	@clients = Client.order('created_at DESC')
	erb :appointments
end

get '/client/:id' do
	@client= Client.find (params[:id])
	erb :client
	end