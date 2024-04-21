var width,width2;
width=0
width2=0

draw_clear(global.col_main)

TTY=0

draw_text_1color(8+4,360+6+4,COMPILE_LABEL,COMPILE_LABEL_COLOR,1)

with (TextArea) {
    textarea_draw()
}

with (Scrollbar) {
    draw_button_ext(x,sy,w,h,!grab,global.col_main)
}

with (Button) {
    if (mouse_check_button_pressed(mb_left)) if (instance_position(MOUSE_X,MOUSE_Y,id)) {
        event_user(2)
    }

    button_draw()
}

with (Button) if (focus && alt!="") drawtooltip(alt)
