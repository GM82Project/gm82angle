if (window_has_focus()) {
    if (!FOCUSED) {
        if (TEXT_IN!=file_text_read_all(FILENAME))
            if (show_question("The shader source was edited. Would you like to reload it?"))
                load_shader(FILENAME)
    }
    FOCUSED=1
} else FOCUSED=0

i=0 repeat (file_drag_count()) {
    fn=file_drag_name(i)
    ext=string_lower(filename_ext(fn))
    if (ext==".glsl" || ext=".hlsl" || ext=".txt") {load_shader(fn) break}
}
file_drag_clear()
