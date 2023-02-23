#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
down=0
color=global.col_main
type=0
downcount=0
gray=0
focus=0
visibility=0
sprite=-1

text=""
alt=""

w=32
h=32
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
focus=instance_position(MOUSE_X,MOUSE_Y,id)

if (down!=0) {
    //click button
    if (!focus) down=-1
    else down=abs(down)
    downcount+=1
    if (downcount>room_speed/3) button_held()
    if (!mouse_check_button(mb_left)) {
        if (down && !gray && !(downcount>room_speed/3)) button_actions()
        down=0
    }
} else downcount=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=w
image_yscale=h
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///click
down=1
