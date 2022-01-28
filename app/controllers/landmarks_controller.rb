class LandmarksController < ApplicationController
  # add controller methods

   #index page
   get '/landmarks' do 
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  #new action
  get '/landmarks/new' do 
    erb :'landmarks/new'
  end

  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
    redirect to "/landmarks/#{@landmark.id}"
  end
  
  #show action
  get '/landmarks/:id' do 
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end

  #edit
  get '/landmarks/:id/edit' do 
    @original_landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end


  patch "/landmarks/:id" do 
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])

    redirect to "/landmarks/#{@landmark.id}"
  end





end

