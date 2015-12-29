var buff = argument[0];
packet = buffer_read(buff,buffer_u8);

switch(packet)
    {
    case 1:
        {
        var time = buffer_read(buff,buffer_u32);
        ping = current_time - time;
        break;
        }
    case 4:
        {//client spawn
        with instance_create(64,64,Player)
            {
            owner = other.id
            }
        }
/*    
    case 10:
        {
        x = buffer_read(buffer,buffer_s16)
        y = buffer_read(buffer,buffer_s16)
        break
        }
*/
    }
