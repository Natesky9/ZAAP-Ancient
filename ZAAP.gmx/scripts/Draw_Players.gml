for (i = 0;i < ds_list_size(playerlist); i += 1)
    {
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    var p = ds_list_find_value(playerlist,i)
    draw_text(0,64+16*i,"Player "+string(i)+": "+ string(p))
    }
