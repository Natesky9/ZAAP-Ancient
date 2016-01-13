//send text from client to server
//=======================================================//
if object_index == Client
    {
    var psay = argument[0]
    
    seek(bout)
    write_packet(3)
    buffer_write(bout,buffer_string,psay)
    network_send_packet(client_socket,bout,tell(bout))
    exit
    }
//=======================================================//
if object_index == Host
    {
    var sss = argument[0]
    var psay = argument[1]
    var p = ds_list_size(playerlist)-1
    
    for (i = 0;i <= p;i += 1)
        {
        var get_socket = ds_list_find_value(playerlist,i)
            seek(bout)
            write_packet(3)
            buffer_write(bout,buffer_u8,sss)
            buffer_write(bout,buffer_string,psay)
            
            ds_grid_add(packets,3,0,1)
            ds_grid_add(packets,3,1,tell(bout))
            
            network_send_packet(get_socket,bout,tell(bout))
        }
    }
//=======================================================//
