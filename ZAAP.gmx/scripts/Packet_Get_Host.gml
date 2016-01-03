var buffer = argument0
var sss = argument1
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
        network_send_packet(sss,buffer_host,buffer_tell(buffer_host));
        break;
        }
    case 8:
        {
        show_debug_message("Packet 8")
        
        var objx = buffer_read(buffer,buffer_s32)
        var objy = buffer_read(buffer,buffer_s32)
        var dir = buffer_read(buffer,buffer_f32)
        var spd = buffer_read(buffer,buffer_f32)
        var sock = buffer_read(buffer,buffer_u8)
        var obj = buffer_read(buffer,buffer_u8)
        if obj == 2
            {
            show_debug_message("firing complete")
            show_debug_message("creating at :" + string(objx) + "," + string(objy))
            new_obj = instance_create(objx,objy,fire)
            new_obj.direction = dir
            new_obj.speed = spd
            new_obj.sss = sock
            }
        
        show_debug_message("Host recieved")
        show_debug_message(string(objx))
        show_debug_message(string(objy))
        show_debug_message(string(dir))
        show_debug_message(string(spd))
        show_debug_message(string(sock))
        show_debug_message(string(obj))
        Packet_8(objx,objy,dir,spd,sock,obj)
        break
        }
    case 10:
        {
        var player = ds_map_find_value(playerobjects,sss)
        var plax = buffer_read(buffer,buffer_s32)
        var play = buffer_read(buffer,buffer_s32)
        (player).x = (plax)
        (player).y = (play)
        Packet_11(sss,plax,play)
        break
        }
    case 21:
        {
        var psay = buffer_read(buffer,buffer_string)
        show_debug_message("say")
        Packet_22(sss,psay)
        break
        }
    }
