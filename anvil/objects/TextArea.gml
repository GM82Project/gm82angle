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
osf=0
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
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scrollf=inch(lerp(scrollf,scroll,1/3),scroll,1/200)

if (osf!=scrollf) {
    surface_set(string(id),w-8,h-8)
    draw_clear($808080)
    draw_text_ext(4,-th*scrollf,text,-1,w-16)
    surface_reset()
}

osf=scrollf
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=w
image_yscale=h
