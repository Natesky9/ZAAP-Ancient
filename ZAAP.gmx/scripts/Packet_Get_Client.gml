var buff = argument[0];
packet = buffer_read(buff,buffer_u8);

switch(packet)
    {
    case 1:
        {
        var time = buffer_read(buff,buffer_u32);
        ping = current_time - time;
        break;
        }
    case 4:
        {//client spawn
        sock = buffer_read(buff,buffer_u8)
        
        var pal = instance_create(64,64,Player)
        ds_map_add(players,sock,pal)
        pal.sock = sock
        }
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
        var plsocket = buffer_read(buff,buffer_u32)
        var plax = buffer_read(buff,buffer_s32)
        var play = buffer_read(buff,buffer_s32)
        player = ds_map_find_value(players,plsocket)
        if player > 0
            {
            (player).x = (plax)
            (player).y = (play)
            }
        }
    }
