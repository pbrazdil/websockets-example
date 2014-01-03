@clients = []

WebSocketsApp = -> (env) do
  if Faye::WebSocket.websocket?(env)
    ws = Faye::WebSocket.new(env)

    ws.on :open do |_|
      @clients << ws # let's save client
    end

    ws.on :close do |_|
      ws.send 'Closing...'

      @clients.delete ws
      ws = nil
    end

    ws.on :message do |msg|
      puts msg.data
      @clients.each do |socket|
        socket.send msg.data
      end
    end

    ws.rack_response

  else
    [301, { 'Location' => '/chat'}, []]
  end
end

def WebSocketsApp.log(message); $stdout.puts message; end
