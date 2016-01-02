//object create script
var objx = argument0
var objy = argument1
var dir = argument2
var spd = argument3
var sock = argument4
var obj = argument5
show_debug_message("1: " + string(obj))

if object_index == Client
    {
    buffer_reset(buffer_client)
    buffer_write(buffer_client,buffer_u8,8)
    buffer_write(buffer_client,buffer_s32,objx)
    buffer_write(buffer_client,buffer_s32,objy)
    buffer_write(buffer_client,buffer_f32,dir)
    buffer_write(buffer_client,buffer_f32,spd)
    buffer_write(buffer_client,buffer_u8,0)
    buffer_write(buffer_client,buffer_string,obj)
show_debug_message("2: " + string(obj))
    network_send_packet(client_socket,buffer_client,buffer_tell(buffer_client))
    
show_debug_message("Sent packet")
    exit
    }    
else
    {

    for (i = 0;i <ds_list_size(playerlist);i += 1)
        {
        var sss = ds_list_find_value(playerlist,i)
        buffer_reset(buffer_host)
        buffer_write(buffer_host,buffer_u8,8)
        buffer_write(buffer_host,buffer_s32,objx)
        buffer_write(buffer_host,buffer_s32,objy)
        buffer_write(buffer_host,buffer_f32,dir)
        buffer_write(buffer_host,buffer_f32,spd)
        buffer_write(buffer_host,buffer_u8,sock)
        buffer_write(buffer_host,buffer_string,obj)
show_debug_message("3: " + string(obj))
        network_send_packet(sss,buffer_host,buffer_tell(buffer_host))
        }
    }
