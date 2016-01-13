//client packet receiving
var packet = read(b.u8);
//=======================================================//
switch(packet)
    {
    case 1:
        {
        var time = read(buffer_u32);
        ping = current_time - time;
        break;
        }
//-----------------------------------------//
    case 4:
        {//client spawn object
        show_debug_message("receiving packet 4")
        sss = read_sss()
        var pal = instance_create(128,128,Player)
        ds_list_add(playerlist,sss)
        ds_map_add(players,sss,pal)
        pal.sss = sss
        Packet_10(pal.x,pal.y,pal.direction)
        break
        }
//-----------------------------------------//
    case 5:
        {
        var num = read(b.u8)
        repeat (num)
            {
            var get_sss = read_sss()
            var plax = read(buffer_s32)
            var play = read(buffer_s32)
            
            var pal = instance_create(plax,play,Player)
            ds_list_add(playerlist,get_sss)
            ds_map_add(players,get_sss,pal)
            (pal).sss = get_sss
            }
        break
        }
//-----------------------------------------//
    case 6:
        {
        var get_sss = read_sss()
        var pal = instance_create(128,128,Player)
        ds_list_add(playerlist,get_sss)
        ds_map_add(players,get_sss,pal)
        (pal).sss = get_sss
        break
        }
//-----------------------------------------//
    case 7:
        {
        var get_sss = read_sss()
        var pal = ds_map_find_value(players,get_sss)
        with pal instance_destroy()
        ds_list_delete(playerlist,get_sss)
        ds_map_delete(players,get_sss)
        break
        }
//-----------------------------------------//
    case 8:
        {
        Packet_8_Get()
        break
        }
//-----------------------------------------//
    case 9:
        {
        get_ssn = read(b.text)
        
        var get_object = ds_map_find_value(shipyards,get_ssn)
        var pos = ds_list_find_index(shipyardlist,get_ssn)
        ds_list_delete(shipyardlist,pos)
        ds_map_delete(shipyards,get_ssn)
        
        with get_object
            instance_destroy()
        break
        }
//-----------------------------------------//

    case 10:
        {
        var get_sss = read_sss()
        var plax = read(buffer_f32)
        var play = read(buffer_f32)
        var pladir = read(buffer_f32)
        var player_temp = ds_map_find_value(players,get_sss)
        if !is_undefined(player_temp)
            {
            (player_temp).x = (plax)
            (player_temp).y = (play)
            (player_temp).direction = (pladir)
            }
        break
        }
//-----------------------------------------//
    case 14:
        {
        show_debug_message("receiving grid data")
        var pal = ds_map_find_value(players,sss)
        var get_sss = read_sss()
        
        var jj = read(b.u8)
        var kk = read(b.u8)
        ds_grid_resize(pal.grid,jj,kk)
        ds_grid_clear(pal.grid,0)
        
        for (k = 0;k < kk;k += 1)
            {
            for (j = 0;j < jj;j += 1)
                {
                var v = read(b.u8,)
                ds_grid_set(pal.grid,j,k,v)
                }
            }
        
        show_debug_message("end receiving grid")
        show_debug_message("loaded grid")
        with pal
        Draw_V_Buffer()
        break;
        }
//-----------------------------------------//
    case 15:
        {
        var num = read(b.u8)
        
        for (i = 0;i < num;i += 1)
            {
            var get_sss = read(b.u8)
            var pal = ds_map_find_value(players,get_sss)
            var jj = read(b.u8)
            var kk = read(b.u8)
            ds_grid_resize(pal.grid,jj,kk)
            ds_grid_clear(pal.grid,0)
            show_debug_message("Writing grid for player")
            //------------------------------------//
            for (k = 0;k < kk;k += 1)
                {
                for (j = 0; j < jj;j += 1)
                    {
                    var n = read(b.u8)
                    ds_grid_set(pal.grid,j,k,n)
                    }
                }
            //------------------------------------//
            with pal
            Draw_V_Buffer()
            }
        break
        }
//-----------------------------------------//
    case 16:
        {
        show_debug_message("receiving NEW grid data")
        var get_sss = read_sss()
        var jj = read(b.u8)
        var kk = read(b.u8)
        var pal = ds_map_find_value(players,get_sss)
        ds_grid_resize(pal.grid,jj,kk)
        ds_grid_clear(pal.grid,0)
        
        for (k = 0;k < kk;k += 1)
            {
            for (j = 0;j < jj;j += 1)
                {
                var v = read(b.u8,)
                ds_grid_set(pal.grid,j,k,v)
                }
            }
        
        show_debug_message("end receiving NEW grid data")
        show_debug_message("loaded NEW grid")
        with pal
        Draw_V_Buffer()
        break;
        }
//-----------------------------------------//

    case 3:
        {
        var get_sss = read_sss()
        var get_say = read(buffer_string)
        var pal = ds_map_find_value(players,get_sss)
        (pal).say = (get_say)
        (pal).saytimer = string_length(get_say)*room_speed/2
        }
        break
    }
//=======================================================//


//Phew, that's alot to read, innit?
