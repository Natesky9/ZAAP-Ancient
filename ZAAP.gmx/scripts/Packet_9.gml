//packet 9 is player create
//prevent duplicate creates on host

var going = argument0

switch (going)
    {
    case "in":
        {
        switch (Network.mode)
            {
            //--------------------//
            case "host":
                {
                
                }
            //--------------------//
            case "client":
                {
                player = buffer_read(buffer,buffer_u32)
                with instance_create(64,64,Player)
                    {
                    owner = player
                    }
                }
            //--------------------//
            }
        }
//----------------------------------------//
    case "out":
        {
        switch (Network.mode)
            {
            //-----------------------//
            case "host":
                {
                buffer_reset()
                socket = ds_map_find_value( async_load , "socket" );
                player = instance_create(64,64,Player)
                ds_map_add(playerlist,socket,player)
                buffer_write(buffer,buffer_u8,9)
                buffer_write(buffer,buffer_u32,player)
                Send_Packet(Packet_9)
                }
            //-----------------------//
            case "client":
                {

                }
            //-----------------------//
            }
        }
    }
