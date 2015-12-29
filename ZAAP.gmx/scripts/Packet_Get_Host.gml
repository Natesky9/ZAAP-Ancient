var buffer = argument0
var socket = argument1
var packet = buffer_read(buffer,buffer_u8)

switch(packet)
    {
    case 1:
        {
        var t = buffer_read(buffer,buffer_u32);
        buffer_seek(buffer_host,buffer_seek_start,0);
        //packet type
        buffer_write(buffer_host,buffer_u8,1);
        buffer_write(buffer_host,buffer_u32,t);
        network_send_packet(socket,buffer_host,buffer_tell(buffer_host));
        break;
        }
    case 10:
        {
        var play = ds_map_find_value(playerobjects,socket)
        with (play)
            {
            x = buffer_read(buffer,buffer_s32)
            y = buffer_read(buffer,buffer_s32)
            }
        }
    }
