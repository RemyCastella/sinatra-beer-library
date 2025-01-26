require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "json"
require "faker"

Dir[File.join(__dir__, 'app', 'models', '*.rb')].each { |file| require file }

set :database, { adapter: "sqlite3", database: "db/beerlib.sqlite3" }
set :views, File.join(__dir__, "app", "views")

get "/" do
  @beers = Beer.all.sample(10).uniq(&:name)
  @users = User.all
  erb :index
end

get "/users/:username" do
  @user = User.find_by(username: params[:username])
  favorites = Favorite.where(user: @user)
  @favorite_beers = favorites.map { |favorite| Beer.find(favorite.beer_id.to_i) }.uniq(&:name)
  erb :users
end

get "/beers/:beer_name" do
  @beer = Beer.all.select { |beer| beer.name.downcase.gsub(" ", "_") == params[:beer_name] }.first
  erb :beer
end
