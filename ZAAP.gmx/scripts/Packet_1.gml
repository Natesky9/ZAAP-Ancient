//packet 1 is ping
//client sends system time
//server sends it back
//ping is time it takes to recieve it
//--------------------------//
var going = argument0



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
                var ping = buffer_read(buffer,buffer_u32)
                Send_Packet(Packet_1)
                exit
                }
            //----------------------//
            case "client":
                {//this is the ping time to the host
                ping = buffer_read(buffer,buffer_u32)
                exit
                }
            //----------------------//
            }
        }
//------------------------------------------------------//
    case "out":
        {
        switch (mode)
            {
            case "host":
                {//return the ping to the client
                buffer_reset()
                buffer_write(buffer,buffer_u8,1)
                buffer_write(buffer,buffer_u32,ping)
                exit
                }
            case "client":
                {//ping the host
                buffer_reset()
                buffer_write(buffer,buffer_u8,1)
                buffer_write(buffer,buffer_u32,current_time)
                exit
                }
            }
        }
    }
