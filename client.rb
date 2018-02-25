require 'socket'

class MyTCPClient
  attr_reader :socket

  def initialize
    @socket = Socket.new(:INET, :STREAM)
  end

  def connect(remote_port, remote_host)
    remote_addr = Socket.pack_sockaddr_in(remote_port, remote_host)
    @socket.connect(remote_addr)
    puts "Client ready to establish connection"
  end
end

client = MyTCPClient.new
client.connect(80, 'www.google.com')
client.socket.write( "GET / HTTP/1.0\r\n\r\n" )
response = client.socket.read
puts "Response from server:"
puts response
