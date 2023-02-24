i=0 repeat (file_drag_count()) {
    fn=file_drag_name(i)
    ext=string_lower(filename_ext(fn))
    if (ext==".glsl" || ext==".hlsl" || ext==".txt" || ext==".shader") {load_shader(fn) window_set_foreground() break}
}
file_drag_clear()
