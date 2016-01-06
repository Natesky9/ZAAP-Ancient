plax = argument0
play = argument1
pladir = argument2
//replace with packet
seek(bout)
write_packet(10)
buffer_write(bout,buffer_f32,plax)
buffer_write(bout,buffer_f32,play)
buffer_write(bout,buffer_f32,pladir)

network_send_packet(client_socket,bout,tell(bout))

