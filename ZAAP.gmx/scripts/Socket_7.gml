show_debug_message("Socket " + string(argument0) + " disconnected")

//send all players the disconnected socket
show_debug_message("Sending Packet 7")

var sss = argument0

for (i = 0;i < ds_list_size(playerlist);i += 1)
    {
    var get_player = ds_list_find_value(playerlist,i)
    buffer_seek(bbb,buffer_seek_start,0)
    buffer_write(bbb,buffer_u8,7)
    buffer_write(bbb,buffer_u8,sss)

    network_send_packet(get_player,bbb,buffer_tell(bbb))
    }


