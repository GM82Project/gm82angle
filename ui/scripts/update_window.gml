if (window_has_focus()) {
    if (!FOCUSED && FILENAME!="") if (file_exists(FILENAME)) {
        //reload shader from disk when looking at the window
        load_shader(FILENAME)
    }
    FOCUSED=1
} else FOCUSED=0

i=0 repeat (file_drag_count()) {
    fn=file_drag_name(i)
    ext=string_lower(filename_ext(fn))
    if (ext==".glsl" || ext==".hlsl" || ext==".txt" || ext==".shader") {load_shader(fn) break}
}
file_drag_clear()
