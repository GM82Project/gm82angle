i=0 repeat (file_drag_count()) {
    fn=file_drag_name(i)
    ext=string_lower(filename_ext(fn))
    if (ext==".glsl" || ext==".hlsl" || ext==".txt" || ext==".shader") {load_shader(fn) window_set_foreground() break}
}
file_drag_clear()

if (keyboard_check_pressed(ord("V")) && keyboard_check(vk_control)) {
    if (clipboard_has_text())
        load_shader("Pasted from clipboard",clipboard_get_text())
}
if (keyboard_check_pressed(vk_f5)) {
    button_actions("reload")
    button_actions("compile")
}

if (window_is_minimized()) {room_speed=5 set_automatic_draw(0)}
else if (!mouse_in_window()) {room_speed=10 set_automatic_draw(0)}
else {if (room_speed!=60) TextArea.osf=-1 room_speed=60 set_automatic_draw(1)}
