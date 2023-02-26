silent=0
copyu=0
clip=0
type=""

cli="Command line:#anvil "
i=1 repeat (parameter_count()) {
    str=parameter_string(i)
    cli+=str+" "
    switch (str) {
        case "silent": silent=1 break
        case "copyu": copyu=1 break
        case "clipboard": clip=1 break
        case "vs2": case "ps2": case "vs3": case "ps3": case "studio": case "shadertoy": type=str
    }
i+=1}
cli+="##"

foot="##Usage:#anvil [file] [flags]##Flags:#vs2 vs3 ps2 ps3 studio shadertoy#silent copyu clipboard"

if (clip) load_shader("Pasted from clipboard",clipboard_get_text())
else {
    FILENAME=parameter_string(1)
    if (!file_exists(FILENAME)) {
        if (!silent) show_message(cli+"Error: input file doesn't exist."+foot)
        exit
    }

    load_shader(FILENAME)
}

if (type!="") {
    TYPE=type
    if (TYPE!="vs2" && TYPE!="ps2" && TYPE!="vs3" && TYPE!="ps3" && TYPE!="studio" && TYPE!="shadertoy") {
        if (!silent) show_message(cli+"Error: invalid shader type."+foot)
        exit
    }
}

if (TYPE=="") {
    if (!silent) show_message(cli+"Error: could not detect type of input file. Please specify a type using a flag."+foot)
    exit
}

compile_shader()

if (!COMPILED) {
    if (!silent) show_message(cli+"Compilation error:##"+textarea_get("output"))
    exit
}

if (copyu && clip) clipboard_set_text(pack_shader()+crlf+crlf+copy_uniforms())
else {
    if (clip) clipboard_set_text(pack_shader())
    if (copyu) clipboard_set_text(copy_uniforms())
}
