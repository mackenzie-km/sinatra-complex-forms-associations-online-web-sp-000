class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    erb :'/pets/new'
  end

  post '/pets' do
    @pet = Pet.create(params[:pet])
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do
    if !parmas[:owner].keys.include?("pet_ids")
      params[:owner]["pet_ids"] = []
    end

    @pet = Pet.find(params[:id])
    @pet.update(params["pet"])
      if !params["owner"]["name"].empty?
        @pet.owners << Owner.create(name: params["owner"]["name"])
      end
    redirect to "pets/#{@pet.id}"
  end

end
