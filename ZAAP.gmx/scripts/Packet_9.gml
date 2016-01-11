//object destroy script

//=======================================================//
if is_host()
    {
    var ssn = argument[0]
    
    var get_object = ds_map_find_value(shipyards,ssn)
    var pos = ds_list_find_index(shipyardlist,ssn)
    ds_list_delete(shipyardlist,pos)
    ds_map_delete(shipyards,ssn)
    
    with get_object
        instance_destroy()
    
    seek(bout)
    write(b.u8,9)
    write(b.text,ssn)
    
    for (i = 0;i < ds_list_size(playerlist);i += 1)
        {
        var sock = ds_list_find_value(playerlist,i)
        network_send_packet(sock,bout,tell(bout))
        }
    }
