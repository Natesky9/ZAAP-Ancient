//object create script


//=======================================================//
if object_index == Client
    {
    var o = argument[0]
    seek(bout)
    write_packet(8)
    write(b.u8,o)
    //
    switch o
        {
        case obj.shipyard:
            {
            //Client will never spawn shipyards?
            break
            }
        //------------------------------//
        case obj.bullet:
            {//x,y,dir,spd
            var objx = argument[1]
            var objy = argument[2]
            var dir = argument[3]
            var spd = argument[4]
            
            write(b.s32,objx)
            write(b.s32,objy)
            write(b.f32,dir)
            write(b.u8,spd)
            break
            }
        //------------------------------//
        case obj.plasma:
            {//x,y,dir,spd,col
            var objx = argument[1]
            var objy = argument[2]
            var dir = argument[3]
            var spd = argument[4]
            var colr = argument[5]
            var colg = argument[6]
            var colb = argument[7]
            
            write(b.s32,objx)
            write(b.s32,objy)
            write(b.f32,dir)
            write(b.u8,spd)
            write(b.u8,colr)
            write(b.u8,colg)
            write(b.u8,colb)
            break
            }
        //------------------------------//
        case obj.laser:
            {//x,y,dir,col
            var objx = argument[1]
            var objy = argument[2]
            var dir = argument[3]
            
            write(b.s32,objx)
            write(b.s32,objy)
            write(b.f32,dir)
            break
            }
        //------------------------------//
        }
    //
    network_send_packet(client_socket,bout,tell(bout))
    exit
    }
//=======================================================//
if object_index == Host
    {
    var o = argument[0]
    //start new code

    seek(bout)
    write_packet(8)
    write(b.u8,o)
    //
    switch o
        {//object attributes
        case obj.shipyard:
            {
            var objx = argument[1]
            var objy = argument[2]
            var objw = argument[3]
            var objh = argument[4]
            
            do 
                {
                var ssn = random_string(6)
                }
            until 
                ds_list_find_index(shipyardlist,ssn)<=0
            
            var object = instance_create(objx,objy,Shipyard)
            ds_list_add(shipyardlist,ssn)
            ds_map_add(shipyards,ssn,object)
            
            show_debug_message(ssn)
            
            object.ssn = ssn
            object.width = objw
            object.height = objh
            
            write(b.text,ssn)
            write(b.s32,objx)
            write(b.s32,objy)
            write(b.u8,objw)
            write(b.u8,objh)
            //add in any other data here
            
            break
            }
        //------------------------------//
        case obj.bullet:
            {//x,y,dir,spd
            var sss = argument[1]
            var objx = argument[2]
            var objy = argument[3]
            var dir = argument[4]
            var spd = argument[5]
            
            write(b.u8,sss)
            write(b.s32,objx)
            write(b.s32,objy)
            write(b.f32,dir)
            write(b.u8,spd)
            break
            }
        //------------------------------//
        case obj.plasma:
            {//x,y,dir,spd,col
            var sss = argument[1]
            var objx = argument[2]
            var objy = argument[3]
            var dir = argument[4]
            var spd = argument[5]
            var colr = argument[6]
            var colg = argument[7]
            var colb = argument[8]
            
            write(b.u8,sss)
            write(b.s32,objx)
            write(b.s32,objy)
            write(b.f32,dir)
            write(b.u8,spd)
            write(b.u8,colr)
            write(b.u8,colg)
            write(b.u8,colb)
            break
            }
        //------------------------------//
        case obj.laser:
            {//x,y,dir,col
            var sss = argument[1]
            var objx = argument[2]
            var objy = argument[3]
            var dir = argument[4]
            
            write(b.u8,sss)
            write(b.s32,objx)
            write(b.s32,objy)
            write(b.f32,dir)
            break
            }
        //------------------------------//
        }
    //
    for (i = 0;i < ds_list_size(playerlist);i += 1)
        {
        var sock = ds_list_find_value(playerlist,i)
        network_send_packet(sock,bout,tell(bout))
        }
        exit
    //end new code
    }
//=======================================================//
