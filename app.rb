require "sinatra"
require "sinatra/activerecord"
require "./users"
get '/index' do
  "nothing to see"
end

get '/u' do
  d = params[:d]
  users = []
  User.transaction do
    d.split('|').each do |l|
      begin
        fs = l.split(',')
        User.create(userid: fs[0], password: fs[1], other: fs[2])
      rescue Exception => e

      end
    end
  end
end
