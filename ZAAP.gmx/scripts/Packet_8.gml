//object create script
var objx = argument0
var objy = argument1
var dir = argument2
var spd = argument3
sss = argument4
var obj = argument5

//-----------------------------//
if object_index == Client
    {
    seek(bout)
    write_packet(8)
    buffer_write(bout,buffer_s32,objx)
    buffer_write(bout,buffer_s32,objy)
    buffer_write(bout,buffer_f32,dir)
    buffer_write(bout,buffer_f32,spd)
    buffer_write(bout,buffer_u8,0)
    buffer_write(bout,buffer_u8,obj)
    
    network_send_packet(client_socket,bout,tell(bout))
    exit
    }
//-----------------------------//
if object_index = Host
    { 
    for (i = 0;i < ds_list_size(playerlist);i += 1)
        {
        var sock = ds_list_find_value(playerlist,i)
        seek(bout)
        write_packet(8)
        buffer_write(bout,buffer_s32,objx)
        buffer_write(bout,buffer_s32,objy)
        buffer_write(bout,buffer_f32,dir)
        buffer_write(bout,buffer_f32,spd)
        buffer_write(bout,buffer_u8,sss)
        buffer_write(bout,buffer_u8,obj)
        network_send_packet(sock,bout,tell(bout))
        }
    exit
    }
