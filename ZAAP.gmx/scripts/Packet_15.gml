//send the newly connected player all previous players
show_debug_message("Sending Packet 15")

var sss = argument0
var num = ds_list_size(playerlist)

seek(bout)
write_packet(15)
buffer_write(bout,buffer_u8,num-1)

for (i = 0; i < num;i += 1)
    {
    var get_player = ds_list_find_value(playerlist,i)
    if get_player != sss
        {
        buffer_write(bout,buffer_u8,get_player)
        var pal = ds_map_find_value(playerobjects,get_player)
        var get_grid = pal.grid
        var jj = ds_grid_width(get_grid)
        var kk = ds_grid_height(get_grid)
        buffer_write(bout,buffer_u8,jj)
        buffer_write(bout,buffer_u8,kk)
//----------------------------------------//
        for (k = 0;k < kk;k += 1)
            {
            for (j = 0; j < jj;j += 1)
                {
                buffer_write(bout,buffer_u8,ds_grid_get(get_grid,j,k))
                }
            }
//----------------------------------------//
        }
    }
network_send_packet(sss,bout,tell(bout))
