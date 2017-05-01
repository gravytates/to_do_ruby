require 'sinatra'
require 'sinatra/reloader'
require './lib/task'
require 'pry'

DB = PG.connect({:dbname => "to_do"})

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
