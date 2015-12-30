obj = argument0
//replace with packet

buffer_seek(buffer_client,buffer_seek_start,0)
buffer_write(buffer_client,buffer_u8,10)
buffer_write(buffer_client,buffer_s32,obj.x)
buffer_write(buffer_client,buffer_s32,obj.y)
buffer_write(buffer_client,buffer_s32,obj.sock)

network_send_packet(socket,buffer_client,buffer_tell(buffer_client))

