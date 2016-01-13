//move script
//currently only supports coords and direction
//=======================================================//
if object_index == Client
    {
    plax = argument[0]
    play = argument[1]
    pladir = argument[2]
    
    seek(bout)
    write_packet(10)
    buffer_write(bout,buffer_f32,plax)
    buffer_write(bout,buffer_f32,play)
    buffer_write(bout,buffer_f32,pladir)
    
    network_send_packet(client_socket,bout,tell(bout))
    exit
    }
//=======================================================//
if object_index == Host
    {
    var sss = argument[0]
    var plax = argument[1]
    var play = argument[2]
    var pladir = argument[3]
    
    var p = ds_list_size(playerlist)
    
    seek(bout)
    write_packet(10)
    buffer_write(bout,buffer_u8,sss)
    buffer_write(bout,buffer_f32,plax)
    buffer_write(bout,buffer_f32,play)
    buffer_write(bout,buffer_f32,pladir)
    
    for (i = 0;i < p;i += 1)
        {
        var get_socket = ds_list_find_value(playerlist,i)
        if get_socket != sss
            {
            ds_grid_add(packets,10,0,1)
            ds_grid_add(packets,10,1,tell(bout))
            show_debug_message("adding 10")
            
            network_send_packet(get_socket,bout,tell(bout))
            }
        }
    exit
    }
//=======================================================//
