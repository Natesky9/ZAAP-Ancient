var pound = 0
string_replace_all(keyboard_string,"#"," ")
for (i = 1;i <= string_length(keyboard_string);i += 1)
    {
    var t = string_char_at(keyboard_string,i)
    if t == "#"
        {
        pound = 0
        }
    else pound += 1
    
    if pound > 12 && t == " "
        {
        string_delete(keyboard_string,i,1)
        keyboard_string = string_insert("#",keyboard_string,i)
        pound = 0
        }    
    show_debug_message(string_char_at(keyboard_string,i))
    }

