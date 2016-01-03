plax = argument0
play = argument1
//replace with packet

buffer_reset()
buffer_write(bbb,buffer_u8,10)
buffer_write(bbb,buffer_s32,plax)
buffer_write(bbb,buffer_s32,play)

network_send_packet(client_socket,bbb,buffer_tell(bbb))

