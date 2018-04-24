require "sinatra"
require "sinatra/activerecord"
require_relative './models/Robot'

set :database, {adapter: 'postgresql', database: 'crudpractice'}

#Basic CRUD Operations in Sinatra w/ AR

#Get Details on all Robots (R)
get '/robots' do 
    @robots = Robot.all
    erb :index
end

#Get Details on specific robot (R)
get '/robots/:id' do
    @specific_robot = Robot.find(params[:id])
    erb :show
end

#Render form for creating a new robot (C)
get '/robots/new'
    erb :new
end

#Create new robot from /new route (C)
post '/robots/new' do
    @new_robot = Robot.create(params[:article])
    redirect '/robots'
end
  

#Render form for editing a new robot (U)
get '/robots/:id/edit'
    @specific_robot = Robot.find(params[:id])
    erb :edit
end

#Resources
# Why we cant use PUT/PATCH/DELETE in forms https://stackoverflow.com/questions/16805956/why-dont-browsers-support-put-and-delete-requests-and-when-will-they
# PUT vs PATCH https://medium.com/backticks-tildes/restful-api-design-put-vs-patch-4a061aa3ed0b
# PUT -> Replace whole record
# PATCH -> Update parts of the record


#Edit robot from /id/edit route (U)
patch '/robots/:id' do
    @specific_robot = Robot.find(params[:id])

end
  
#Delete Robot (D)
delete '/robots/:id' do
    Robot.destroy(params[:id])
end