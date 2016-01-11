//=======================================================//
if object_index == Client
    {
    var o = read(b.u8)
    
    switch o
        {
        case obj.shipyard:
            {
            var get_ssn = read(b.text)
            var objx = read(b.s32)
            var objy = read(b.s32)
            var objw = read(b.u8)
            var objh = read(b.u8)
            
            var object = instance_create(objx,objy,Shipyard)
            (object).ssn = get_ssn
            
            ds_list_add(shipyardlist,get_ssn)
            ds_map_add(shipyards,get_ssn,object)
            break
            }
        //------------------------------//
        case obj.bullet:
            {
            var get_sss = read_sss()
            var objx = read(b.s32)
            var objy = read(b.s32)
            var dir = read(b.f32)
            var spd = read(b.u8)
            
            var new_obj = instance_create(objx,objy,fire)
            (new_obj).sprite_index = (banana)
            (new_obj).sss = (get_sss)
            (new_obj).direction = (dir)
            (new_obj).speed = (spd)
            
            break
            }
        //------------------------------//
        case obj.plasma:
            {
            var get_sss = read_sss()
            var objx = read(b.s32)
            var objy = read(b.s32)
            var dir = read(b.f32)
            var spd = read(b.u8)
            var colr = read(b.u8)
            var colg = read(b.u8)
            var colb = read(b.u8)
            
            var new_obj = instance_create(objx,objy,fire)
            (new_obj).sprite_index = (pear)
            (new_obj).sss = (get_sss)
            (new_obj).direction = (dir)
            (new_obj).speed = (spd)
            (new_obj).color = make_colour_rgb(colr,colg,colb)
            break
            }
        //------------------------------//
        case obj.laser:
            {
            var get_sss = read_sss()
            var objx = read(b.s32)
            var objy = read(b.s32)
            var dir = read(b.f32)
            var new_obj = instance_create(objx,objy,fire)
            (new_obj).sprite_index = (strawberry)
            (new_obj).sss = (get_sss)
            (new_obj).direction = (dir)
            (new_obj).speed = 20

            break
            }
        }
    exit
    }
//=======================================================//
if object_index == Host
    {
    var sss = argument[0]
    var o = read(b.u8)
    
    switch o
        {
        //------------------------------//
        case obj.bullet:
            {
            var objx = read(b.s32)
            var objy = read(b.s32)
            var dir = read(b.f32)
            var spd = read(b.u8)
            
            Packet_8(o,sss,objx,objy,dir,spd)
            
            var new_obj = instance_create(objx,objy,fire)
            (new_obj).sprite_index = (banana)
            (new_obj).sss = (sss)
            (new_obj).direction = (dir)
            (new_obj).speed = (spd)
            
            break
            }
        //------------------------------//
        case obj.plasma:
            {
            var objx = read(b.s32)
            var objy = read(b.s32)
            var dir = read(b.f32)
            var spd = read(b.u8)
            var colr = read(b.u8)
            var colg = read(b.u8)
            var colb = read(b.u8)
            
            Packet_8(o,sss,objx,objy,dir,spd,colr,colg,colb)
            
            var new_obj = instance_create(objx,objy,fire)
            (new_obj).sprite_index = (pear)
            (new_obj).sss = (sss)
            (new_obj).direction = (dir)
            (new_obj).speed = (spd)
            (new_obj).color = make_colour_rgb(colr,colg,colb)
            break
            }
        //------------------------------//
        case obj.laser:
            {
            var objx = read(b.s32)
            var objy = read(b.s32)
            var dir = read(b.f32)
            
            Packet_8(o,sss,objx,objy,dir)
        
            var xx = lengthdir_x(16,dir)
            var yy = lengthdir_y(16,dir)
            
            var new_obj = instance_create(objx,objy,fire)
            (new_obj).sprite_index = (strawberry)
            (new_obj).sss = (sss)
            (new_obj).direction = (dir)
            (new_obj).speed = 20
            

            break
            }
        //------------------------------//
        }
    exit
    }
//=======================================================//
