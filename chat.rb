class Chat < Sinatra::Base
  get '/' do
    erb :index
  end
end