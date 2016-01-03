//object create script

var sss = argument0
show_debug_message("Server Side Socket " + string(sss) + " connected")
    buffer_seek(bbb,buffer_seek_start,0);
    buffer_write(bbb,buffer_u8,4);
    buffer_write(bbb,buffer_u8,sss);
    network_send_packet(sss,bbb,buffer_tell(bbb));

