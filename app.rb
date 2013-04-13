require "sinatra"
require "sinatra/activerecord"
require "./users"

set environment: :production
set port: 80

get '/' do
  "<h1>nothing to see</h1>"
end

post '/u' do
  d = params[:d]
  sql = "insert into users(userid, password, other) values"
  d.split('|').each do |l|
    fs = l.split(',')
    sql << "('#{fs[0].delete("'")}','#{fs[1].delete("'")}','#{fs[2].delete("'")}'),"
  end
  ActiveRecord::Base.connection.execute(sql.chop)
end
