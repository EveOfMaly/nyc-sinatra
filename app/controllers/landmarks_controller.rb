class LandmarksController < ApplicationController
  # add controller methods

   #read
   get '/landmarks' do 
    @landmarks = Landmark.all

    erb :'landmarks/index'
  end

  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
    redirect to '/landmarks'
  end
  
  #create
  get '/landmarks/new' do 
    erb :'landmarks/new'
  end


  get '/landmarks/:id' do 
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end



  get '/landmarks/:id/edit' do 
    @original_landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end


  patch '/landmarks/:id' do 
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])

    redirect to '/landmarks/:id'
  end



end

