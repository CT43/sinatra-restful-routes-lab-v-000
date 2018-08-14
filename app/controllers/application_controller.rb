class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get 'recipe/new' do
    erb :new
  end

  post 'recipe/new' do
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect 'recipes/#{recipe.id}'
  end

  get 'recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end
end
