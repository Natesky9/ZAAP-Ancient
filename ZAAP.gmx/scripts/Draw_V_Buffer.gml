VBuff = vertex_create_buffer()
vertex_begin(VBuff,global.basic_format)
var jj = ds_grid_width(grid)
var kk = ds_grid_height(grid)

for (k = 0;k < kk;k += 1)
    {
    for (j = 0; j < jj;j += 1)
        {
//----------------------------------//
        switch ds_grid_get(grid,j,k)
            {
            case 0:
                {
                var c1 = c_black 
                var c2 = c_black
                var c2 = c_black
                var a = 0
                break
                }
            case 1:
                {
                var c1 = c_green
                var c2 = c_blue
                var c3 = c_white
                var a = 1
                break
                }
            case 2:
                {
                var c1 = c_red
                var c2 = c_yellow
                var c3 = c_white
                var a = 1
                break
                }
            }
//----------------------------------//
        
        vertex_colour(VBuff,c1,a)
        vertex_position(VBuff,j*16,k*16)
        vertex_colour(VBuff,c2,a)
        vertex_position(VBuff,j*16,k*16+16)
        vertex_colour(VBuff,c3,a)
        vertex_position(VBuff,j*16+16,k*16+16)
        vertex_colour(VBuff,c1,a)
        vertex_position(VBuff,j*16,k*16)
        vertex_colour(VBuff,c3,a)
        vertex_position(VBuff,j*16+16,k*16+16)
        vertex_colour(VBuff,c2,a)
        vertex_position(VBuff,j*16+16,k*16)
        }
    }
vertex_end(VBuff)
    
