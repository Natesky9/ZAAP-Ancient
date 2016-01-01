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
        {//client spawn
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

    case 11:
        {
        var get_sss = buffer_read(buff,buffer_u8)
        var plax = buffer_read(buff,buffer_s32)
        var play = buffer_read(buff,buffer_s32)
        var player_temp = ds_map_find_value(players,get_sss)
        show_debug_message(string(player_temp))
        if !is_undefined(player_temp)
            {
            show_debug_message("updating player " + string(get_sss))
            (player_temp).x = (plax)
            (player_temp).y = (play)
            }
        break
        }
        break
    }
