header="
    uniform sampler2D gm_BaseTexture;
    precision mediump float;
"
glsl_compile(header+TEXT_IN)
TEXT_OUT=glsl_get_code()

error=glsl_get_info()
if (TEXT_OUT=="") {
    COMPILE_LABEL="Transpile failed. Check errors below."
    COMPILE_LABEL_COLOR=$ff
    if (string_pos("gl_Position",TEXT_IN)) COMPILE_LABEL="Compile failed. Is this a vertex shader?"
    textarea_set("output",error)
} else {
    studio_varyings=""

    if (string_pos("_v_vTexcoord",TEXT_OUT)) studio_varyings+="_v_vTexcoord.xy=input.uv;"+crlf
    if (string_pos("_v_vColour",TEXT_OUT)) studio_varyings+="_v_vColour=input.color;"+crlf

    TEXT_OUT=string_replace(TEXT_OUT,"@@ PIXEL OUTPUT @@","
    struct PS_INPUT {
        float2 uv: TEXCOORD0;
        float4 color: COLOR;
    };
    
    struct PS_OUTPUT {
        float4 color: COLOR;
    };
    
    PS_OUTPUT generateOutput() {
        PS_OUTPUT output;
        output.color=gl_Color[0];
        return output;
    }
    
    void populateStudioVaryings(PS_INPUT input) {
"+studio_varyings+"
    }
    ")
    TEXT_OUT=string_replace(TEXT_OUT,"@@ PIXEL MAIN PARAMETERS @@","PS_INPUT input")
    TEXT_OUT=string_replace(TEXT_OUT,"@@ MAIN PROLOGUE @@","populateStudioVaryings(input);")

    TRANSPILED=1
    TRANSPILED_TEXT=TEXT_OUT

    profile="ps_2_b"
    hlsl_compile(TEXT_OUT,profile)
    error=hlsl_get_errors()
    if (error!="") {
        profile="ps_3_0"
        hlsl_compile(TEXT_OUT,profile)
        error=hlsl_get_errors()
        if (error!="") {
            COMPILE_LABEL="Compile failed. Check errors below."
            COMPILE_LABEL_COLOR=$ff
            textarea_set("output",error)
            exit
        }
    }

    COMPILED=1
    COMPILE_LABEL="Compile successful."
    COMPILE_LABEL_COLOR=$FF00
    textarea_set("output",output_uniforms())
    save_shader()
}
