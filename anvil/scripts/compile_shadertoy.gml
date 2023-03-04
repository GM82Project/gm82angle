header="
    #define HW_PERFORMANCE (1)
    precision mediump float;
    uniform vec3      iResolution;
    uniform float     iTime;
    uniform float     iChannelTime[4];
    uniform vec4      iMouse;
    uniform vec4      iDate;
    uniform float     iSampleRate;
    uniform vec3      iChannelResolution[4];
    uniform int       iFrame;
    uniform float     iTimeDelta;
    uniform float     iFrameRate;
    void st_assert( bool cond, int v ) {if(!cond){if(v==0)gl_FragColor.x=-1.0;else if(v==1)gl_FragColor.y=-1.0;else if(v==2)gl_FragColor.z=-1.0;else gl_FragColor.w=-1.0;}}
    void st_assert( bool cond        ) {if(!cond)gl_FragColor.x=-1.0;}
"

footer="    
    void main() {
        gl_FragColor = vec4(0.0,0.0,0.0,1.0);
        vec4 color = vec4(1e20);
        mainImage( color, gl_FragCoord.xy * iResolution.xy );
        color.w = 1.0;
        if(gl_FragColor.w<0.0) color=vec4(1.0,0.0,0.0,1.0);
        if(gl_FragColor.x<0.0) color=vec4(1.0,0.0,0.0,1.0);
        if(gl_FragColor.y<0.0) color=vec4(0.0,1.0,0.0,1.0);
        if(gl_FragColor.z<0.0) color=vec4(0.0,0.0,1.0,1.0);
        if(gl_FragColor.w<0.0) color=vec4(1.0,1.0,0.0,1.0);
        gl_FragColor = vec4(color.xyz,1.0);
    }
"
glsl_compile(header+TEXT_IN+footer)
TEXT_OUT=glsl_get_code()
error=glsl_get_info()
if (TEXT_OUT=="") {
    COMPILE_LABEL="Transpile failed. Check errors below."
    COMPILE_LABEL_COLOR=$ff
    if (string_pos("gl_Position",TEXT_IN)) COMPILE_LABEL="Compile failed. Is this a vertex shader?"
    textarea_set("output",error)
} else {
    TEXT_OUT=string_replace(TEXT_OUT,"@@ PIXEL OUTPUT @@","
    struct PS_INPUT {
        float4 position: POSITION0;
        float4 uv: TEXCOORD0;
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
    ")
    TEXT_OUT=string_replace(TEXT_OUT,"@@ PIXEL MAIN PARAMETERS @@","PS_INPUT input")
    TEXT_OUT=string_replace(TEXT_OUT,"@@ MAIN PROLOGUE @@","
        gl_Color[0]=input.color;
        gl_FragCoord=input.uv;
    ")

    TRANSPILED=1
    TRANSPILED_TEXT=TEXT_OUT

    profile="ps_3_0"
    hlsl_compile(TEXT_OUT,profile)
    error=hlsl_get_errors()
    if (error!="") {
        COMPILE_LABEL="Compile failed. Check errors below."
        COMPILE_LABEL_COLOR=$ff
        textarea_set("output",error)
        exit
    }

    COMPILED=1
    COMPILE_LABEL="Compile successful."
    COMPILE_LABEL_COLOR=$FF00
    textarea_set("output",output_uniforms())
    save_shader()
}
