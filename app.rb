require 'sinatra'
require 'sinatra/reloader'

require_relative('lib/task.rb')
require_relative('lib/todoList.rb')

todo_list = TodoList.new("Josh")

task = Task.new("Walk the dog")
task1 = Task.new("Take out the trash")
task2 = Task.new("Do your homework")
task3 = Task.new("Buy your mealpass")

todo_list.add_task(task)
todo_list.add_task(task1)
todo_list.add_task(task2)
todo_list.add_task(task3)

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
	redirect to '/tasks'
end