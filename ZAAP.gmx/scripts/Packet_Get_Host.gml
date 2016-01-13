//host packet receiving
var sss = argument0
var packet = read(buffer_u8)
//=======================================================//
switch(packet)
    {
    case 1:
        {
        Packet_1(sss)
        break;
        }
    case 3:
        {
        var psay = read(buffer_string)
        var player = ds_map_find_value(players,sss)
        (player).say = (psay)
        (player).saytimer = string_length(psay)*room_speed/2
        Packet_3(sss,psay)
        break
        }
    case 8:
        {
        show_debug_message("Packet 8")
        Packet_8_Get(sss)
        break
        }
    case 10:
        {
        var player = ds_map_find_value(players,sss)
        var plax = read(buffer_f32)
        var play = read(buffer_f32)
        var pladir = read(buffer_f32)
        (player).x = (plax)
        (player).y = (play)
        (player).direction = pladir
        Packet_10(sss,plax,play,pladir)
        
        break
        }
    }
//=======================================================//
