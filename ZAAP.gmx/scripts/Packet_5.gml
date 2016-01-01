//send newly connected socket all previous sockets

var socket = argument0
var num = ds_list_size(playerlist)

for (i = 0;i < num;i += 1)
    {

    buffer_seek(buffer_host,buffer_seek_start,0)
    buffer_write(buffer_host,buffer_u8,5)
    buffer_write(buffer_host,buffer_u8,num-1)
    
    repeat num
        {
        var get_player = ds_list_find_value(playerlist,i)
        if get_player != socket
            {
            var player_obj = ds_map_find_value(playerobjects,get_player)
            var plax = player_obj.x
            var play = player_obj.y
            buffer_write(buffer_host,buffer_u8,get_player)
            buffer_write(buffer_host,buffer_s32,plax)
            buffer_write(buffer_host,buffer_s32,play)
            }
        network_send_packet(socket,buffer_host,buffer_tell(buffer_host))

        }
    }

