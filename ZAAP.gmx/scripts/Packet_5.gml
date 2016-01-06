//send newly connected Server Side Socket to all previous sockets
show_debug_message("Sending Packet 5")

var sss = argument0
var plax = 0
var play = 0
var num = ds_list_size(playerlist)

seek(bout)
write_packet(5)
buffer_write(bout,buffer_u8,num-1)

for (i = 0; i < num;i += 1)
    {
    var get_player = ds_list_find_value(playerlist,i)
    if get_player != sss
        {
        var player_obj = ds_map_find_value(playerobjects,get_player)
        var plax = player_obj.x
        var play = player_obj.y
        
        buffer_write(bout,buffer_u8,get_player)
        buffer_write(bout,buffer_s32,plax)
        buffer_write(bout,buffer_s32,play)
        }
    }

network_send_packet(sss,bout,tell(bout))
