//send all previous sockets the newly connected
show_debug_message("Sending Packet 6")

var sss = argument0

for (i = 0;i < ds_list_size(playerlist);i += 1)
    {
    buffer_seek(buffer_host,buffer_seek_start,0)
    buffer_write(buffer_host,buffer_u8,6)
    buffer_write(buffer_host,buffer_u8,sss)
    
    var get_player = ds_list_find_value(playerlist,i)
    if get_player != sss
        {
        network_send_packet(get_player,buffer_host,buffer_tell(buffer_host))
        }
    
    }


