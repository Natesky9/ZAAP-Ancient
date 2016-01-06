//send all players the disconnected socket

var sss = argument0

for (i = 0;i < ds_list_size(playerlist);i += 1)
    {
    var get_player = ds_list_find_value(playerlist,i)
    seek(bout)
    write_packet(7)
    buffer_write(bout,buffer_u8,sss)

    network_send_packet(get_player,bout,tell(bout))
    }


