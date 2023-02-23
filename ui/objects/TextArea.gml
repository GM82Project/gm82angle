#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
th=1
text=""
scroll=0

scrollf=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_position(MOUSE_X,MOUSE_Y,id)) {
    v=mouse_wheel_down()-mouse_wheel_up()
    if (v!=0) {
        scroll=median(0,scroll+(v*H3L)/th,1)
        with (Scrollbar) if (scroll=other.id) {
            sy=median(ystart,y+scroll.scroll*size,ystart+size)
        }
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=w
image_yscale=h
