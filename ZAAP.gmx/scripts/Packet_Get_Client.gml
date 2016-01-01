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
        client_sock = buffer_read(buff,buffer_u8)

        var pal = instance_create(128,128,Player)
        ds_map_add(players,client_sock,pal)
        pal.sock = client_sock
        break
        }
//-----------------------------------------//
    case 5:
        {
        var num = buffer_read(buff,buffer_u8)
        repeat num
            {
            var socks = buffer_read(buff,buffer_u8)
            var plax = buffer_read(buff,buffer_s32)
            var play = buffer_read(buff,buffer_s32)
            
            var pal = instance_create(plax,play,Player)
            ds_map_add(players,socks,pal)
            (pal).sock = socks
            }
        break
        }//-----------------------------------------//
    case 6:
        {
        var socks = buffer_read(buff,buffer_u8)
        var pal = instance_create(128,128,Player)
        ds_map_add(players,socks,pal)
        (pal).sock = socks
        break
        }
//-----------------------------------------//
/*    
    case 10:
        {
        x = buffer_read(buffer,buffer_s16)
        y = buffer_read(buffer,buffer_s16)
        break
        }
*/
    case 11:
        {
        var plsocket = buffer_read(buff,buffer_u8)
        var plax = buffer_read(buff,buffer_s32)
        var play = buffer_read(buff,buffer_s32)
        var player_temp = ds_map_find_value(players,plsocket)
        show_debug_message(string(player_temp))
        if !is_undefined(player_temp)
            {
            show_debug_message("updating player " + string(plsocket))
            (player_temp).x = (plax)
            (player_temp).y = (play)
            }
        break
        }
        break
    }
