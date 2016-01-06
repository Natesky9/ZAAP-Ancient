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
        
        var objx = buffer_read(bin,buffer_s32)
        var objy = buffer_read(bin,buffer_s32)
        var dir = buffer_read(bin,buffer_f32)
        var spd = buffer_read(bin,buffer_f32)
        buffer_read(bin,buffer_u8)
        var obj = buffer_read(bin,buffer_u8)
        if obj == 2
            {
            new_obj = instance_create(objx,objy,fire)
            new_obj.direction = dir
            new_obj.speed = spd
            new_obj.sss = sss
            }
        Packet_8(objx,objy,dir,spd,sss,obj)
        break
        }
    case 10:
        {
        var player = ds_map_find_value(playerobjects,sss)
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
        Packet_22(sss,psay)
        break
        }
    }
