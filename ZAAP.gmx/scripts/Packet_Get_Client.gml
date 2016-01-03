var buff = argument[0];
var packet = buffer_read(buff,buffer_u8);

switch(packet)
    {
    case 1:
        {
        var time = buffer_read(buff,buffer_u32);
        ping = current_time - time;
        break;
        }
//-----------------------------------------//
    case 4:
        {//client spawn object
        sss = buffer_read(buff,buffer_u8)
        var pal = instance_create(128,128,Player)
        ds_map_add(players,sss,pal)
        pal.sss = sss
        break
        }
//-----------------------------------------//
    case 5:
        {
        var num = buffer_read(buff,buffer_u8)
        repeat (num -1)
            {
            var get_sss = buffer_read(buff,buffer_u8)
            var plax = buffer_read(buff,buffer_s32)
            var play = buffer_read(buff,buffer_s32)
            
            var pal = instance_create(plax,play,Player)
            ds_map_add(players,get_sss,pal)
            (pal).sss = get_sss
            }
        break
        }
//-----------------------------------------//
    case 6:
        {
        var get_sss = buffer_read(buff,buffer_u8)
        var pal = instance_create(128,128,Player)
        ds_map_add(players,get_sss,pal)
        (pal).sss = get_sss
        break
        }
//-----------------------------------------//
    case 7:
        {
        var get_sss = buffer_read(buff,buffer_u8)
        var pal = ds_map_find_value(players,sss)
        with pal instance_destroy()
        ds_map_delete(players,get_sss)
        break
        }
//-----------------------------------------//
    case 8:
        {
        var objx = buffer_read(buff,buffer_s32)
        var objy = buffer_read(buff,buffer_s32)
        var dir = buffer_read(buff,buffer_f32)
        var spd = buffer_read(buff,buffer_f32)
        var sock = buffer_read(buff,buffer_u8)
        var obj = buffer_read(buff,buffer_u8)
        
        show_debug_message("Client recieved")
        show_debug_message(string(objx))
        show_debug_message(string(objy))
        show_debug_message(string(dir))
        show_debug_message(string(spd))
        show_debug_message(string(sock))
        show_debug_message(string(obj))
        show_debug_message("End Client revieve")
        
        
        if obj == 2
            {
            show_debug_message("firing complete")
            show_debug_message("creating at :" + string(objx) + "," + string(objy))
            new_obj = instance_create(objx,objy,fire)
            new_obj.direction = dir
            new_obj.speed = spd
            new_obj.sss = sock
            }
       break
        }
//-----------------------------------------//

    case 11:
        {
        var get_sss = buffer_read(buff,buffer_u8)
        var plax = buffer_read(buff,buffer_s32)
        var play = buffer_read(buff,buffer_s32)
        var player_temp = ds_map_find_value(players,get_sss)
        if !is_undefined(player_temp)
            {
            (player_temp).x = (plax)
            (player_temp).y = (play)
            }
        break
        }
    case 22:
        {
        var get_sss = buffer_read(buff,buffer_u8)
        var pal = ds_map_find_value(players,get_sss)
        var get_say = buffer_read(buff,buffer_string)
        (pal).say = (get_say)
        (pal).saytimer = string_length(get_say)*60
        }
        break
    }
