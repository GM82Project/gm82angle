scrollf=lerp(scrollf,scroll,1/3)

draw_button_ext(x,y,w,h,0,$808080)
d3d_set_scissor(x+4,y+4,w-8,h-8)
d3d_set_projection_ortho(0,0,w-8,h-8,0)
draw_text(4,-th*scrollf,text)
d3d_set_scissor(0,0,WIDTH,HEIGHT)
d3d_set_projection_default()
