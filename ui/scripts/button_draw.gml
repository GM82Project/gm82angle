up=!down

switch (action) {
    case "shadertype": {
        up=TYPE!=shadertype && !down
        if (TYPE==shadertype) color=$808080 else color=global.col_main
    } break
}

if (object_index==Button) {
    draw_button_ext(x,y,w,h,up,color)

    if (text!="") {
        draw_set_color(global.col_text)
        if (type==0) {
            draw_set_halign(1)
            draw_set_valign(1)
            draw_text(x+w/2,y+h/2,text)
            draw_set_halign(0)
            draw_set_valign(0)
        }
        if (type==1) {
            draw_set_valign(1)
            draw_text(x+w+8,y+h/2,text)
            draw_set_valign(0)
        }
        draw_set_color($ffffff)
    }

    if (sprite!=-1) draw_sprite(sprButtonIcons,sprite,x+(w div 2),y+(h div 2))
}

if (object_index==TextField) {
    if (type==1) {if (gray) color=global.col_main else color=real(text)}
    else {
        if (active) color=$808080
        else {
            if (type==0 || type==2) {
                if (gray) color=global.col_main
                else color=$808080
            } else {
                color=$808080
            }
        }
    }

    draw_button_ext(x,y,w,h,0,color)

    if (text="") {
        str=dtext
        draw_set_color(global.col_main)
    } else {
        str=text
        draw_set_color(global.col_text)
    }
    draw_set_valign(1)
    draw_text(x+8,y+h/2,str)
    draw_set_valign(0)
    draw_set_color($ffffff)
}
