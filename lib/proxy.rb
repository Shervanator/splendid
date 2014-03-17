require 'socket'

class Proxy
  def initialize(hostname)
    @hostname = 'http://www.tutorialspoint.com/'
  end

  def start
    server = TCPServer.open(12345)

    loop do
      Thread.start(server.accept) do |client|
        socket = TCPSocket.open(@hostname, 80)
        while line = client.gets
          socket.print line
          client.send socket.read
        end
        # input = fix_input(client.recv(1024))
        # puts "Input: #{input}"
        # output = injected_output(input)
        # puts "Sending: #{output}"
        # client.puts output
        client.close
      end
    end
  end

  def injected_output(request)
    socket = TCPSocket.open(@hostname, 80)
    puts "Sending request"
    request_to_send = "#{request}\r\n\r\n"
    socket.print(request_to_send)
    puts "Getting Response"
    response = socket.read
    socket.close
    response
  end

  def fix_input(input)
    input.gsub(/localhost:12345/, "#{@hostname}:80")
  end
end