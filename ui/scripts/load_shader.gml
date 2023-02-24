if (argument_count) fn=argument[0]
else fn=get_open_filename("Shader source code|*.hlsl;*.glsl;*.txt;*.shader","")

textfield_set("path",fn)

FILENAME=fn
TEXT_IN=string_replace_all(file_text_read_all(fn),chr(vk_tab),"    ")
TYPE=""

ext=string_lower(filename_ext(fn))
if (ext==".shader") {
    TEXT_IN=string_delete(TEXT_IN,1,string_pos("//######################_==_YOYO_SHADER_MARKER_==_######################@~",TEXT_IN)+73)
    TYPE="studio"
}
if (ext==".glsl") TYPE="shadertoy"
if (ext==".hlsl") {
    if (string_count("POSITION",TEXT_IN)>1) TYPE="vs2"
    else TYPE="ps2"
}
if (ext==".txt") {
    if (string_pos("gl_FragColor",TEXT_IN)) TYPE="shadertoy"
    if (string_pos("gm_BaseTexture",TEXT_IN)) TYPE="studio"
}

room_caption=filename_name(fn)+" - "+version

textarea_set("source",TEXT_IN)
textarea_set("output","")
COMPILED=0
TRANSPILED=0
COMPILE_LABEL="Shader loaded. Could not autodetect type."
with (Button) if (action="shadertype") if (TYPE==shadertype) COMPILE_LABEL="Shader loaded. Autodetected type: "+text
COMPILE_LABEL_COLOR=$ffffff
