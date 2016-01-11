var length = argument0
var str = ""
var char = ""

repeat length
    {
    char = chr(irandom_range(65,90))
    str += char
    }
show_debug_message(str)
return str
