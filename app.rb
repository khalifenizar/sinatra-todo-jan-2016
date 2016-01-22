require 'sinatra'
require 'sinatra/reloader'

require_relative('lib/task.rb')
require_relative('lib/todoList.rb')

todo_list = TodoList.new("Josh")

todo_list.load("tasks.yml")

get '/' do
  erb(:home)
end

get '/tasks' do
  @tasks = todo_list.tasks
  erb(:tasks)
end

get '/new_task' do
  erb(:new_task)
end

post '/create_task' do
  content = params[:task_content]
  task = Task.new(content)
  todo_list.add_task(task)
  todo_list.save("tasks.yml")

  redirect to '/tasks'
end
