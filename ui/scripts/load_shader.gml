if (argument_count) fn=argument[0]
else fn=get_open_filename("Shader source code|*.hlsl;*.glsl;*.txt;*.shader","")

textfield_set("path",fn)

FILENAME=fn
TEXT_IN=file_text_read_all(fn)
TYPE=""

ext=string_lower(filename_ext(fn))
if (ext==".shader") {
    TEXT_IN=string_delete(TEXT_IN,1,string_pos("//######################_==_YOYO_SHADER_MARKER_==_######################@~",TEXT_IN)+73)
    TYPE="glsl"
}
if (ext==".glsl") TYPE="glsl"
if (ext==".hlsl") {
    if (string_count("POSITION",TEXT_IN)>1) TYPE="vs2"
    else TYPE="ps2"
}
if (ext==".txt") {
    if (string_pos("gl_FragColor",TEXT_IN)) TYPE="glsl"
}

room_caption=filename_name(fn)+" - "+version

textarea_set("source",TEXT_IN)
