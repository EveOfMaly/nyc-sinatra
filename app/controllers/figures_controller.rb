class FiguresController < ApplicationController
 
#create
get '/figures/new' do 
    @titles = Title.all 
    @landmarks = Landmark.all
    erb :'figures/new'
end

#index for figures
get '/figures/:id' do 

 
  @figure = Figure.find_by_id(params[:id])
  erb :'figures/show'
end



post '/figures' do 

  @figure = Figure.create(params[:figure]) #create figure

  #create a new title if field is filled in
  @figure.titles << Title.create(params[:new_title]) if !params[:new_title][:name].empty? 
  #create a new landmark if field is filled in
  @figure.landmarks << Landmark.create(params[:landmark]) if !params[:landmark][:name].empty? 

  @figure.save
  redirect to '/figures:id'
end



#read list of all figures.
get '/figures' do 
  @figures = Figure.all 
  erb :'figures/index'
end

#build show


#edit
get '/figures/:id/edit' do 

  @figure = Figure.find_by_id(params[:id])
  @titles = Title.all
  @landmarks = Landmark.all
  erb :'figures/edit'
end

#update
  patch '/figures/:id' do 
  
  @figure = Figure.find_by_id(params[:id])
  @figure.update(name: params[:figure][:name], title_ids: params[:figure][:title_ids], landmark_ids: params[:figure][:landmark_ids])
  
  #create a new title if field is filled in
  @figure.titles << Title.create(params[:new_title]) if !params[:new_title][:name].empty? 
  #create a new landmark if field is filled in
  @figure.landmarks << Landmark.create(params[:landmark]) if !params[:landmark][:name].empty? 

  @figure.save

  erb :'figures/show'
end


#delete

delete '/figures' do 
  Figure.all.clear
  redirect to '/figures'
end










end
