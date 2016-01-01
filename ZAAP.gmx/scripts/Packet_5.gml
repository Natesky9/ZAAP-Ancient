//send newly connected socket all previous sockets
show_debug_message("Sending Packet 5")

var socket = argument0
var plax = 0
var play = 0
var num = ds_list_size(playerlist)
var i = 0

buffer_seek(buffer_host,buffer_seek_start,0)
buffer_write(buffer_host,buffer_u8,5)
buffer_write(buffer_host,buffer_u8,num)

repeat num
    {
    var get_player = ds_list_find_value(playerlist,i)
    (i) += 1
    if get_player != socket
        {
        var player_obj = ds_map_find_value(playerobjects,get_player)
        var plax = player_obj.x
        var play = player_obj.y
        buffer_write(buffer_host,buffer_u8,get_player)
        buffer_write(buffer_host,buffer_s32,plax)
        buffer_write(buffer_host,buffer_s32,play)
        }
    }
show_debug_message("Packet 5")
show_debug_message("Sending to socket " + string(socket))
show_debug_message("Num")
show_debug_message(string(get_player))
show_debug_message(string(plax))
show_debug_message(string(play))

network_send_packet(socket,buffer_host,buffer_tell(buffer_host))

