<<<<<<< HEAD
<<<<<<< HEAD
//send newly connected Server Side Socket to all previous sockets
show_debug_message("Sending Packet 5")

var sss = argument0
=======
//send newly connected socket all previous sockets
show_debug_message("Sending Packet 5")

var socket = argument0
>>>>>>> origin/master
=======
//send newly connected Server Side Socket to all previous sockets
show_debug_message("Sending Packet 5")

var sss = argument0
>>>>>>> refs/remotes/origin/Changes
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
<<<<<<< HEAD
<<<<<<< HEAD
    if get_player != sss
=======
    if get_player != socket
>>>>>>> origin/master
=======
    if get_player != sss
>>>>>>> refs/remotes/origin/Changes
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
<<<<<<< HEAD
<<<<<<< HEAD
show_debug_message("Sending to Server Side Socket " + string(sss))
=======
show_debug_message("Sending to socket " + string(socket))
>>>>>>> origin/master
=======
show_debug_message("Sending to Server Side Socket " + string(sss))
>>>>>>> refs/remotes/origin/Changes
show_debug_message("Num")
show_debug_message(string(get_player))
show_debug_message(string(plax))
show_debug_message(string(play))

<<<<<<< HEAD
<<<<<<< HEAD
network_send_packet(sss,buffer_host,buffer_tell(buffer_host))
=======
network_send_packet(socket,buffer_host,buffer_tell(buffer_host))
>>>>>>> origin/master
=======
network_send_packet(sss,buffer_host,buffer_tell(buffer_host))
>>>>>>> refs/remotes/origin/Changes

