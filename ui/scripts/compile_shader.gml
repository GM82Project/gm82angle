COMPILE_LABEL=""
if (FILENAME=="" || TEXT_IN=="") {
    exit
}

if (TYPE=="") {
    COMPILE_LABEL="Please select the shader type first"
    COMPILE_LABEL_COLOR=$FF
}

if (TYPE=="glsl") {
    glsl_compile(TEXT_IN)
    TEXT_OUT=glsl_get_code()
    error=glsl_get_info()
    if (TEXT_OUT=="") {
        COMPILE_LABEL="Compile failed. Check errors below."
        COMPILE_LABEL_COLOR=$FF
        textarea_set("output",error)
    } else textarea_set("output",TEXT_OUT)
    exit
}

if (TYPE=="vs2") profile="vs_2_a"
if (TYPE=="ps2") profile="ps_2_b"
if (TYPE=="vs3") profile="vs_3_0"
if (TYPE=="ps3") profile="ps_3_0"

hlsl_compile(TEXT_IN,profile)
error=hlsl_get_errors()

if (error!="") {
    COMPILE_LABEL="Compile failed. Check errors below."
    COMPILE_LABEL_COLOR=$FF
    textarea_set("output",error)
} else {
    COMPILE_LABEL="Compile successful."
    COMPILE_LABEL_COLOR=$FF00
    count=hlsl_get_uniform_count()
    str="Uniform count: "+string(count)+"##"
    i=0 repeat (count) {
        str+=hlsl_get_uniform_name(i,0)+"#"
    i+=1}
    textarea_set("output",str)
}
