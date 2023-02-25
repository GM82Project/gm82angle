globalvars()

WIDTH=room_width
HEIGHT=room_height

TYPE=""
FILENAME="untitled"
TEXT_IN=""
TEXT_OUT=""
OUTPUT=""

draw_set_font(fntCode)
H3L=string_height("|#|#|")

theme_init()

createui()

file_drag_enable(1)

room_caption=version
set_application_title(room_caption)
