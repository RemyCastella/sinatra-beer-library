require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "json"
require "faker"

Dir[File.join(__dir__, 'app', 'models', '*.rb')].each { |file| require file }

set :database, { adapter: "sqlite3", database: "db/beerlib.sqlite3" }

get "/" do
  beer = Beer.all.sample
  beer.users.to_json
end
