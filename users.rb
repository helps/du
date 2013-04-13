require "sinatra"
require "sinatra/activerecord"

set :database, {adapter: "mysql2", host: "localhost", database: "user", username: "root", password: ""}

class User < ActiveRecord::Base
end
