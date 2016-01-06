//send text from client to server
var psay = argument0

seek(bout)
write_packet(21)
buffer_write(bout,buffer_string,psay)
network_send_packet(client_socket,bout,tell(bout))
