Bundler.require(:default)
load './websockets.rb'
load './chat.rb'

#Faye::WebSocket.load_adapter('puma')

run Rack::URLMap.new('/chat' => Chat, '/' => WebSocketsApp)
