var buffer = argument0
<<<<<<< HEAD
<<<<<<< HEAD
var sss = argument1
=======
var socket_in = argument1
>>>>>>> origin/master
=======
var sss = argument1
>>>>>>> refs/remotes/origin/Changes
var packet = buffer_read(buffer,buffer_u8)

switch(packet)
    {
    case 1:
        {
        var t = buffer_read(buffer,buffer_u32);
        buffer_seek(buffer_host,buffer_seek_start,0);
        //packet type
        buffer_write(buffer_host,buffer_u8,1);
        buffer_write(buffer_host,buffer_u32,t);
<<<<<<< HEAD
<<<<<<< HEAD
        network_send_packet(sss,buffer_host,buffer_tell(buffer_host));
=======
        network_send_packet(socket_in,buffer_host,buffer_tell(buffer_host));
>>>>>>> origin/master
=======
        network_send_packet(sss,buffer_host,buffer_tell(buffer_host));
>>>>>>> refs/remotes/origin/Changes
        break;
        }
    case 10:
        {
<<<<<<< HEAD
<<<<<<< HEAD
        var player = ds_map_find_value(playerobjects,sss)
=======
        var player = ds_map_find_value(playerobjects,socket_in)
>>>>>>> origin/master
=======
        var player = ds_map_find_value(playerobjects,sss)
>>>>>>> refs/remotes/origin/Changes
        var plax = buffer_read(buffer,buffer_s32)
        var play = buffer_read(buffer,buffer_s32)
        (player).x = (plax)
        (player).y = (play)
<<<<<<< HEAD
<<<<<<< HEAD
        Packet_11(sss,plax,play)
        break
        }
    case 21:
        {
        var psay = buffer_read(buffer,buffer_string)
        show_debug_message("say")
        Packet_22(sss,psay)
        break
=======
        Packet_11(socket_in,plax,play)
=======
        Packet_11(sss,plax,play)
>>>>>>> refs/remotes/origin/Changes
        
>>>>>>> origin/master
        }
    }
