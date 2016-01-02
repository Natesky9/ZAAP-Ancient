show_debug_message("Socket " + string(argument0) + " disconnected")
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> refs/remotes/origin/Changes

//send all players the disconnected socket
show_debug_message("Sending Packet 7")

var sss = argument0

for (i = 0;i < ds_list_size(playerlist);i += 1)
    {
    var get_player = ds_list_find_value(playerlist,i)
    buffer_seek(buffer_host,buffer_seek_start,0)
    buffer_write(buffer_host,buffer_u8,7)
    buffer_write(buffer_host,buffer_u8,sss)

    network_send_packet(get_player,buffer_host,buffer_tell(buffer_host))
    }


<<<<<<< HEAD
=======
>>>>>>> origin/master
=======
>>>>>>> refs/remotes/origin/Changes
