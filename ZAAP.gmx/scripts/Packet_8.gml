//object create script
var objx = argument0
var objy = argument1
var dir = argument2
var spd = argument3
var sock = argument4
var obj = argument5


if object_index == Client
    {
    show_debug_message("client objx " + string(argument0))
    show_debug_message("client objy " + string(argument1))
    show_debug_message("client dir " + string(argument2))
    show_debug_message("client spd " + string(argument3))
    show_debug_message("client sock " + string(argument4))
    show_debug_message("client obj " + string(argument5))
    
    buffer_reset(buffer_client)
    buffer_write(buffer_client,buffer_u8,8)
    buffer_write(buffer_client,buffer_s32,objx)
    buffer_write(buffer_client,buffer_s32,objy)
    buffer_write(buffer_client,buffer_f32,dir)
    buffer_write(buffer_client,buffer_f32,spd)
    buffer_write(buffer_client,buffer_u8,0)
    buffer_write(buffer_client,buffer_u8,obj)
    
    network_send_packet(client_socket,buffer_client,buffer_tell(buffer_client))
    show_debug_message("Sent packet")
    exit
    }    
else
    {
    show_debug_message("host objx " + string(argument0))
    show_debug_message("host objy " + string(argument1))
    show_debug_message("host dir " + string(argument2))
    show_debug_message("host spd " + string(argument3))
    show_debug_message("host sock " + string(argument4))
    show_debug_message("host obj " + string(argument5))
    
    for (i = 0;i <ds_list_size(playerlist);i += 1)
        {
        var sss = ds_list_find_value(playerlist,i)
        show_debug_message("sending to socket " + string(sss))
        buffer_reset(buffer_host)
        buffer_write(buffer_host,buffer_u8,8)
        buffer_write(buffer_host,buffer_s32,objx)
        buffer_write(buffer_host,buffer_s32,objy)
        buffer_write(buffer_host,buffer_f32,dir)
        buffer_write(buffer_host,buffer_f32,spd)
        buffer_write(buffer_host,buffer_u8,sock)
        buffer_write(buffer_host,buffer_u8,obj)
        network_send_packet(sss,buffer_host,buffer_tell(buffer_host))
        show_debug_message("sending complete")
        }
    }
