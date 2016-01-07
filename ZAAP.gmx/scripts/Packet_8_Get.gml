//=======================================================//
if object_index == Client
    {
    var get_sss = read_sss()
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
            
            Packet_8(sss,o,objx,objy,dir,spd)
            
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
            
            Packet_8(sss,o,objx,objy,dir,spd,colr,colg,colb)
            
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
            
            Packet_8(sss,o,objx,objy,dir)
        
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
    }
//=======================================================//
