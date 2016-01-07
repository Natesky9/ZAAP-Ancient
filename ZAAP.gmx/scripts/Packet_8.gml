//object create script

var o = argument[0]

//=======================================================//
if object_index == Client
    {
    seek(bout)
    write_packet(8)
    write(b.u8,o)
    //
    switch o
        {//object attributes
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
        }
    //
    network_send_packet(client_socket,bout,tell(bout))
    exit
    }
//=======================================================//
if object_index = Host
    {
    var sss = argument[0]
    var o = argument[1]
    //start new code

    seek(bout)
    write_packet(8)
    write(b.u8,sss)
    write(b.u8,o)
    //
    switch o
        {//object attributes
        case obj.bullet:
            {//x,y,dir,spd
            var objx = argument[2]
            var objy = argument[3]
            var dir = argument[4]
            var spd = argument[5]
            
            write(b.s32,objx)
            write(b.s32,objy)
            write(b.f32,dir)
            write(b.u8,spd)
            break
            }
        case obj.plasma:
            {//x,y,dir,spd,col
            var objx = argument[2]
            var objy = argument[3]
            var dir = argument[4]
            var spd = argument[5]
            var colr = argument[6]
            var colg = argument[7]
            var colb = argument[8]
            
            write(b.s32,objx)
            write(b.s32,objy)
            write(b.f32,dir)
            write(b.u8,spd)
            write(b.u8,colr)
            write(b.u8,colg)
            write(b.u8,colb)
            break
            }
        case obj.laser:
            {//x,y,dir,col
            var objx = argument[2]
            var objy = argument[3]
            var dir = argument[4]
            
            write(b.s32,objx)
            write(b.s32,objy)
            write(b.f32,dir)
            break
            }
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
