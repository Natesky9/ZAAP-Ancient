//object create script

var sss = argument0
show_debug_message("Server Side Socket " + string(sss) + " connected")
    buffer_seek(buffer_host,buffer_seek_start,0);
    buffer_write(buffer_host,buffer_u8,4);
    buffer_write(buffer_host,buffer_u8,sss);
    network_send_packet(sss,buffer_host,buffer_tell(buffer_host));

