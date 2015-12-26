//packet 10 is player location
//for now, sends player x and y

var going = argument0

switch (going)
    {
    case "in":
        {
        switch (mode)
            {
            //--------------------//
            case "host":
                {
                player = ds_map_find_value(playerlist,socket)
                player.x = buffer_read(buffer,buffer_u32)
                player.y = buffer_read(buffer,buffer_u32)
                }
            //--------------------//
            case "client":
                {
                
                }
            //--------------------//
            }
        }
//----------------------------------------//
    case "out":
        {
        switch (mode)
            {
            //-----------------------//
            case "host":
                {
                
                }
            //-----------------------//
            case "client":
                {
                buffer_reset()
                buffer_write(buffer,buffer_u32,x)
                buffer_write(buffer,buffer_u32,y)
                Send_Packet(Packet_10)
                }
            //-----------------------//
            }
        }
    }
