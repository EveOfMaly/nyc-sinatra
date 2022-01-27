class FiguresController < ApplicationController
 
#create
get '/figures/new' do 
    @titles = Title.all 
    @landmarks = Landmark.all
    erb :'figures/new'
end

#index for figures
get '/figures/:id' do 

  @figure = Figure.find_by(id: params[:id])
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
  @figure = Figure.find_by(params[:id])
  @landmarks = Landmark.all
  @titles = Title.all
  
  erb :'figures/edit'
end

patch '/figures/:id' do 
  
  binding.pry
  @figure = Figure.find_by(params[:id])

  #create a new title if field is filled in
  @figure.titles << Title.create(params[:new_title]) if !params[:new_title][:name].empty? 
  #create a new landmark if field is filled in
  @figure.landmarks << Landmark.create(params[:landmark]) if !params[:landmark][:name].empty? 

  @figure.save



  erb :'figures/show'
end


#delete

delete '/figures' do 

end










end
