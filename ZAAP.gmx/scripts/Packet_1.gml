going = argument0
//going is the direction of the packet
//"in" is sending
//"out" is recieving

switch (going)
    {
    case "in":
        {
        switch (mode)
            {
            //----------------------//
            case "host":
                {//host recieves ping, sends it back
                ping = buffer_read(buffer,buffer_u32)
                Packet_1("out")
                
                }
            //----------------------//
            case "client":
                {//this is the ping time to the host
                ping = buffer_read(buffer,buffer_u32)
                }
            //----------------------//
            }
        }
//--------------------------//
    case "out":
        {
        case "host":
            {//return the ping to the client
            buffer_reset()
            buffer_write(buffer,buffer_u8,1)
            buffer_write(buffer,buffer_u32,ping)
            }
        case "client":
            {//ping the host
            buffer_reset()
            buffer_write(buffer,buffer_u8,1)
            buffer_write(buffer,buffer_u32,0)
            }
        }
    }
