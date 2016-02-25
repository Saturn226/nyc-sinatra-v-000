class FiguresController < ApplicationController
  get '/figures' do 
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/' do
    redirect to '/figures'
  end

  get '/figures/new' do 
    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @title = Title.create(params[:title])
    @figure.titles << @title
    @landmark = Landmark.create(params[:landmark])
    @figure.landmarks << @landmark
  
    @figure.save
    redirect "/figures"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
   end

   get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
     erb :'/figures/edit'
   end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    @title = Title.create(params[:title])
    @figure.titles << @title
    @landmark = Landmark.create(params[:landmark])
    @figure.landmarks << @landmark
  
    @figure.save
     redirect "/figures/#{@figure.id}"
   end
 end

# FiguresController
#   allows you to view form to create a new figure
#   allows you to create a new figure with a title (FAILED - 1)
#   allows you to create a new figure with a landmark (FAILED - 2)
#   allows you to create a new figure with a new title (FAILED - 3)
#   allows you to create a new figure with a new landmark (FAILED - 4)
#   allows you to list all figures (FAILED - 5)
#   allows you to see a single Figure (FAILED - 6)
#   allows you to view form to edit a single figure (FAILED - 7)
#   allows you to edit a single figure (FAILED - 8)