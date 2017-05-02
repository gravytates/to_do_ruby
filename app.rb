require 'sinatra'
require 'sinatra/reloader'
require './lib/task'
require './lib/list'
require 'pg'
require 'pry'

DB = PG.connect({:dbname => "to_do_test"})

also_reload('lib/**/*.rb')

get("/") do
  erb(:index)
end


get('/lists/new') do
  erb(:list_form)
end

post('/lists') do
  name = params.fetch('name')
  list = List.new({:name => name, :id => nil})
  list.save
  erb(:list_success)
end

get('/lists') do
  @lists = List.all
  erb(:lists)
end

get('/lists/:id') do
  @list = List.find(params.fetch('id').to_i)
  erb(:list)
end

post("/tasks") do
  description = params.fetch("description")
  due_date = params.fetch("due_date")
  list_id = params.fetch('list_id').to_i
  @list = List.find(list_id)
  @task = Task.new({:description => description, :due_date => due_date, :list_id => list_id})
  @task.save
  erb(:success)
end
