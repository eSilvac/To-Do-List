require 'sinatra'
require "make_todo"



get '/' do
	redirect '/Bienvenido'
end

get '/Bienvenido' do
	@tareas = Tarea.all
	if @tareas.empty?
		erb :welcome
	else
		redirect '/home'
	end
end

post '/LogIn' do
	Tarea.create(params[:name])
	redirect '/home'
end

get '/home' do
	@ary = Tarea.all
	erb :home
end

post '/NuevaTarea' do
	erb :nuevaTarea
end

post '/nuevaTareaLista' do
	Tarea.create(params[:Tarea])
	redirect '/home'
end

post '/Borrar' do
	Tarea.destroy(params[:borr])
	redirect '/home'
end

post '/Completar' do
	Tarea.update(params[:compl])
	redirect '/home'
end

post '/Cambio' do
	arr = Tarea.all
	i=0
	while i<arr.length
		nombre = arr[i]
		Tarea.destroy(nombre["id"])
		i+=1
	end

	redirect '/Bienvenido'
end
