//send text from client to server
var psay = argument0

buffer_reset(buffer_client)
buffer_write_packet(buffer_client,21)
buffer_write(buffer_client,buffer_string,psay)
network_send_packet(client_socket,buffer_client,buffer_tell(buffer_client))
