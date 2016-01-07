//send all previous sockets the newly connected
show_debug_message("Sending Packet 6")

var sss = argument[0]
var num = ds_list_size(playerlist)

seek(bout)
write_packet(6)
buffer_write(bout,buffer_u8,sss)

for (i = 0;i < num;i += 1)
    {

    
    var get_player = ds_list_find_value(playerlist,i)
    if get_player != sss
        {
        network_send_packet(get_player,bout,tell(bout))
        }
    
    }


