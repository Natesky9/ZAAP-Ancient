//ping packet

if object_index == Host
    {
    var t = read(buffer_u32);
    seek(bout)
    write(buffer_u8,1);
    write(buffer_u32,t);
    network_send_packet(argument[0],bout,tell(bout));
    
    ds_grid_add(packets,1,0,1)
    ds_grid_add(packets,1,1,tell(bout))
    exit
    }
if object_index == Client
    {
    show_debug_message("client packet 1")
    seek(bout)
    write(buffer_u8,1);
    write(buffer_u32,current_time);
    network_send_packet(client_socket,bout,tell(bout));
    }
