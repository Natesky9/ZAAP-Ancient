var packet = argument0
script_execute(packet,"out")
//send the packet
network_send_packet(socket,buffer,buffer_tell(buffer))
