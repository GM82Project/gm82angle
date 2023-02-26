///clickrect(x,y,w,h)

if (!mouse_check_button_pressed(mb_left)) return 0

return point_in_rectangle(MOUSE_X,MOUSE_Y,argument0,argument1,argument2+argument0,argument3+argument1)
