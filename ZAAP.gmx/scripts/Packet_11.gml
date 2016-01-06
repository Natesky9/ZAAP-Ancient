//packet for host to send to all objects, updating the
//x and y of an object

var sss = argument0
var plax = argument1
var play = argument2
var pladir = argument3

var p = ds_list_size(playerlist)-1

for (i = 0;i <= p;i += 1)
    {
    var get_socket = ds_list_find_value(playerlist,i)
    if get_socket != sss
        {
        seek(bout)
        write_packet(11)
        buffer_write(bout,buffer_u8,sss)
        buffer_write(bout,buffer_f32,plax)
        buffer_write(bout,buffer_f32,play)
        buffer_write(bout,buffer_f32,pladir)
        
        
        network_send_packet(get_socket,bout,tell(bout))
        }
    }
