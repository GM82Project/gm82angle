COMPILE_LABEL=""
if (FILENAME=="" || TEXT_IN=="") {
    exit
}

if (TYPE=="") {
    COMPILE_LABEL="Please select the shader type first."
    COMPILE_LABEL_COLOR=$ff
    exit
}

TRANSPILED=0

if (TYPE=="studio") {
    compile_studio()
    exit
}

if (TYPE=="shadertoy") {
    compile_shadertoy()
    exit
}


if (TYPE=="vs2") profile="vs_2_a"
if (TYPE=="ps2") profile="ps_2_b"
if (TYPE=="vs3") profile="vs_3_0"
if (TYPE=="ps3") profile="ps_3_0"

if (!hlsl_compile(TEXT_IN,profile)) {
    COMPILE_LABEL="Compile failed. Check errors below."
    COMPILE_LABEL_COLOR=$ff
    textarea_set("output",hlsl_get_errors())
} else {
    COMPILED=1
    COMPILE_LABEL="Compile successful."
    COMPILE_LABEL_COLOR=$ff00
    textarea_set("output",output_uniforms())
    save_shader()
}
