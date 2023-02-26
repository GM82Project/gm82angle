#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
w=32
h=32

grab=0

sy=y
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_position(MOUSE_X,MOUSE_Y,id) && mouse_check_button_pressed(mb_left)) {
    grab=1
    if (MOUSE_Y=median(sy,MOUSE_Y,sy+32)) dy=MOUSE_Y-sy
    else dy=16
}

if (grab) {
    sy=median(ystart,MOUSE_Y-dy,ystart+size)
    scroll.scroll=(sy-ystart)/size
    if (!mouse_check_direct(mb_left) && !mouse_check_button_pressed(mb_left)) grab=0
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=w
image_yscale=h+size
