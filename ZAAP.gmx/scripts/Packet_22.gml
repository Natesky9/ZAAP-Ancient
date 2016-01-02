var sss = argument0
var psay = argument1
var p = ds_list_size(playerlist)-1

for (i = 0;i <= p;i += 1)
    {
    var get_socket = ds_list_find_value(playerlist,i)
        buffer_seek(buffer_host,buffer_seek_start,0)
        buffer_write(buffer_host,buffer_u8,22)
        buffer_write(buffer_host,buffer_u8,sss)
        buffer_write(buffer_host,buffer_string,psay)
        
        network_send_packet(get_socket,buffer_host,buffer_tell(buffer_host))
    }
