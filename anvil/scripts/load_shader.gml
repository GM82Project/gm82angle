///load_shader(...)
///load_shader(filename)
///load_shader(clipboard,data)

CLIPBOARD=0

if (argument_count==2) {fn=argument[0] data=clipboard_cleanup(argument[1]) ext=".txt" CLIPBOARD=1}
else if (argument_count==1) {fn=argument[0] OUTPUT=fn data=file_text_read_all(fn) ext=string_lower(filename_ext(fn))}
else {
    fn=get_open_filename("Shader source code|*.hlsl;*.glsl;*.txt;*.shader","")
    if (fn=="") exit
    OUTPUT=FILENAME
    data=file_text_read_all(fn)
    ext=string_lower(filename_ext(fn))
}

textfield_set("path",fn)

FILENAME=fn
TEXT_IN=string_replace_all(data,chr(vk_tab),"    ")

if (ext==".shader") {
    TEXT_IN=string_delete(TEXT_IN,1,string_pos("//######################_==_YOYO_SHADER_MARKER_==_######################@~",TEXT_IN)+73)
    TYPE="studio"
}
if (ext==".glsl") TYPE="shadertoy"
if (ext==".hlsl" and TYPE=="") {
    if (string_count("POSITION",TEXT_IN)>1) {
        if (detect_texture_access_in_vs(TEXT_IN)) TYPE="vs3"
        else if (TYPE!="vs3") TYPE="vs2"
    } else {
        if (string_count("VPOS",TEXT_IN)>0) TYPE="ps3"
        if (TYPE!="ps3") TYPE="ps2"
    }
}
if (ext==".txt") {
    if (string_pos("mainImage",TEXT_IN)) TYPE="shadertoy"
    else if (string_pos("gm_BaseTexture",TEXT_IN)) TYPE="studio"
    else {
        if (string_count("POSITION",TEXT_IN)>1) {
            if (detect_texture_access_in_vs(TEXT_IN)) TYPE="vs3"
            else if (TYPE!="vs3") TYPE="vs2"
        } else {
            if (string_count("VPOS",TEXT_IN)>0) TYPE="ps3"
            if (TYPE!="ps3") TYPE="ps2"
        }
    }
}

room_caption=filename_name(fn)+" - "+version

textarea_set("source",TEXT_IN)
textarea_set("output","")
COMPILED=0
TRANSPILED=0
COMPILE_LABEL="Shader loaded. Could not autodetect type."
with (Button) if (action="shadertype") if (TYPE==shadertype) COMPILE_LABEL="Shader loaded. Autodetected type: "+text
COMPILE_LABEL_COLOR=$ffffff
