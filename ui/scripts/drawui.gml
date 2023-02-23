var width,width2;
width=0
width2=0

MOUSE_X=window_mouse_get_x()
MOUSE_Y=window_mouse_get_y()

draw_clear(global.col_main)

with (Button) {
    if (mouse_check_button_pressed(mb_left)) if (instance_position(MOUSE_X,MOUSE_Y,id)) {
        event_user(2)
    }

    button_draw()
}
