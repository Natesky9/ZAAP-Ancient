//player move script
//valid arguments are:
//"left","right","up","down"
if sss == Client.sss
    {
    switch argument0
        {
        case "left":
            {
            direction += 3
            break
            }
        case "right":
            {
            direction -= 3
            break
            }
        case "up":
            {
            x += lengthdir_x(4,direction)
            y += lengthdir_y(4,direction)
            break
            }
        case "down":
            {
            x -= lengthdir_x(1,direction)
            y -= lengthdir_y(1,direction)
            }
        }
            
    with Client
    Packet_10(other.x,other.y,other.direction)
    }

