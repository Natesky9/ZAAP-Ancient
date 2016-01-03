//send text from client to server
var psay = argument0

buffer_reset()
buffer_write_packet(21)
buffer_write(bbb,buffer_string,psay)
network_send_packet(client_socket,bbb,buffer_tell(bbb))
