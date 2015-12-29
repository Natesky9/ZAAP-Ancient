buffer = argument[0]
socket = argument[1]
//start at the begining of the buffer
buffer_seek(buffer,buffer_seek_start,0)
//determine the packet
var packet = buffer_read(buffer,buffer_u8)

switch (packet)
    {
    case 1:
        {//packet 1 is ping packet
        Get_Packet(Packet_1)
        }
    case 10:
        {
        Get_Packet(Packet_10)
        }
    }
