var sss = argument0
var packet = buffer_read(bin,buffer_u8)

switch(packet)
    {
    case 1:
        {
        var t = buffer_read(bin,buffer_u32);
        seek(bout)
        buffer_write(bout,buffer_u8,1);
        buffer_write(bout,buffer_u32,t);
        network_send_packet(sss,bout,buffer_tell(bout));
        break;
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
        var plax = buffer_read(bin,buffer_f32)
        var play = buffer_read(bin,buffer_f32)
        var pladir = buffer_read(bin,buffer_f32)
        (player).x = (plax)
        (player).y = (play)
        (player).direction = pladir
        Packet_11(sss,plax,play,pladir)
        break
        }
    case 21:
        {
        var psay = buffer_read(bin,buffer_string)
        var player = ds_map_find_value(players,sss)
        (player).say = (psay)
        (player).saytimer = string_length(psay)*room_speed/2
        Packet_22(sss,psay) 
        break
        }
    }
