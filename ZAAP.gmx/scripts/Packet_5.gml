var socket = argument0

for (i = 0;i <= ds_list_size(playerlist)-1;i += 1)
    {
    if socket != ds_list_find_value(playerlist,i)
        {
        var pla = ds_list_find_value(playerlist,i)
        var player = ds_map_find_value(playerobjects,pla)
        var plax = player.x
        var play = player.y
        buffer_seek(buffer_host,buffer_seek_start,0)
        buffer_write(buffer_host,buffer_u8,pla)
        buffer_write(buffer_host,buffer_s32,plax)
        buffer_write(buffer_host,buffer_s32,play)
        network_send_packet(socket,buffer_host,buffer_tell(buffer_host))
        }
    }
