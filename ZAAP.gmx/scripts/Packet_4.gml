socket = argument0

    buffer_seek(buffer_host,buffer_seek_start,0);
    buffer_write(buffer_host,buffer_u8,4);
    buffer_write(buffer_host,buffer_u8,socket);
    network_send_packet(socket,buffer_host,buffer_tell(buffer_host));

