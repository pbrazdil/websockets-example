Bundler.require(:default)
load './websockets.rb'
load './chat.rb'

unless ENV['OPENSHIFT_RUBY_SERVER'].nil?
  Faye::WebSocket.load_adapter(ENV['OPENSHIFT_RUBY_SERVER'])
end

run Rack::URLMap.new('/chat' => Chat, '/' => WebSocketsApp)
