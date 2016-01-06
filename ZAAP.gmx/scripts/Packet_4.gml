//object create script

var sss = argument0
seek(bout)
write_packet(4)
buffer_write(bout,buffer_u8,sss);
network_send_packet(sss,bout,tell(bout));
show_debug_message("Sending packet 4")

