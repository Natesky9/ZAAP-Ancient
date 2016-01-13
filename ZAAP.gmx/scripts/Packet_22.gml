//OLD TEXT PACKET
//moved to packet 3
/*
var sss = argument0
var psay = argument1
var p = ds_list_size(playerlist)-1

for (i = 0;i <= p;i += 1)
    {
    var get_socket = ds_list_find_value(playerlist,i)
        seek(bout)
        write_packet(22)
        buffer_write(bout,buffer_u8,sss)
        buffer_write(bout,buffer_string,psay)
        
        ds_grid_add(packets,22,0,1)
        ds_grid_add(packets,22,1,tell(bout))
        
        network_send_packet(get_socket,bout,tell(bout))
    }
    */
