COMPILE_LABEL=""
if (FILENAME=="" || TEXT_IN=="") {
    exit
}

if (TYPE=="") {
    COMPILE_LABEL="Please select the shader type first."
    COMPILE_LABEL_COLOR=$ff
    exit
}

str="Compiling "+filename_name(FILENAME)+"..."
set_application_title(str)
window_set_caption(str)

TRANSPILED=0

if (TYPE=="studio") {
    compile_studio()
    set_application_title(version)
    exit
}

if (TYPE=="shadertoy") {
    compile_shadertoy()
    set_application_title(version)
    exit
}

header=""
if (TYPE=="vs2") profile="vs_2_a"
if (TYPE=="ps2") profile="ps_2_b"
if (TYPE=="vs3") profile="vs_3_0"
if (TYPE=="ps3") profile="ps_3_0"

if (TYPE=="vs3") {
    header="
        float4 tex2D(SamplerState __samp,float2 __coord) {
            return tex2Dlod(__samp,float4(__coord.x,__coord.y,0,0));
        }
    "
}

if (!hlsl_compile(header+TEXT_IN,profile)) {
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

set_application_title(version)
