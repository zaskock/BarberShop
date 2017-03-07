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
	validates :name, presence: true, length: {minimum: 3}
	validates :phone, presence: true, length: {minimum: 10}
	validates :time_from, presence: true
	validates :time_to, presence: true
end

before do
	@barbers = Barber.all
	@contacts = Contact.all
end

get '/' do
	erb :index
end

get '/visit' do
	@c=Client.new
	erb :visit
	
end

post '/visit' do

	@c=Client.new params[:client]

	if @c.save
		erb "Dear #{@c[:name]}, we'll be waiting for you at #{@c[:datestamp]}"
	else
		@error = "An error occurred, the record has not been saved to database! </br>Details: "+@c.errors.full_messages.first
		erb :visit
	end

	end

get '/contacts' do
	@title = 'Barber Shop - Add a contact'
	@con=Contact.new
	erb :contacts
	
end

post '/contacts' do

	@con=Contact.new params[:contact]

	if @con.save
		erb "Thank you #{@con[:name]}, your contact data was saved successfully!"
	else
		@error = "An error occurred, the record has not been saved to database! </br>Details: "+@con.errors.full_messages.first
		erb :contacts
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