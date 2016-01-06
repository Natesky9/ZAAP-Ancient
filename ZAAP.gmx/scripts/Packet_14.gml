//grid transfer packet
//use bout buffer for this?
sss = argument0
get_grid = argument1


seek(bout)
write_packet(14)
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
show_debug_message("Sending grid data")
network_send_packet(sss,bout,tell(bout))

