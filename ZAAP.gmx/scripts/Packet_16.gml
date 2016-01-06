var get_sss = argument0
var get_grid = argument1
var num = ds_list_size(playerlist)

seek(bout)
write_packet(16)
write_sss()
var jj = ds_grid_width(get_grid)
var kk = ds_grid_height(get_grid)

buffer_write(bout,buffer_u8,jj)
buffer_write(bout,buffer_u8,kk)

for (k = 0;k < kk;k += 1)
    {
    for (j = 0; j < jj;j += 1)
        {
        buffer_write(bout,buffer_u8,ds_grid_get(get_grid,j,k))
        }
    }
    
for (i = 0;i < num; i += 1)
    {
    var get_player = ds_list_find_value(playerlist,i)
    if get_player != sss
        {
        show_debug_message("Sending new player grid data")
        network_send_packet(get_player,bout,tell(bout))
        }
    }
