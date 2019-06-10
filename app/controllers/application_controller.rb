
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles/new"
  end

  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  get "/articles" do
    @articles = Article.all

    erb :index
  end

  post "/articles" do
    @article = Article.create(params)

    redirect to "/articles/#{@article.id}"
  end

  get "/articles/:id" do
    @article = Article.find_by(id: params[:id])

    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])

    erb :edit
  end

  patch "/articles/:id" do
    binding.pry
    @article = Article.find_by(id: params[:id])
    @article.update(title: params[:title], content: params[:content])
    erb :show
  end

  delete '/articles/:id' do

    erb :index
  end
end
