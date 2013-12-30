require 'bundler'
Bundler.require


DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/rabbits.db")

class App < Sinatra::Application
# list all rabbits
get '/rabbits' do
  @rabbits = Rabbit.all
  haml :index
end

get '/rabbits/new' do
  @rabbit = Rabbit.new
  haml :new
end