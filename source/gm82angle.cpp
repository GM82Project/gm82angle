#define GMREAL extern "C" __declspec(dllexport) double __cdecl
#define GMSTR extern "C" __declspec(dllexport) const char* __cdecl

#include "GLSLANG/ShaderLang.h"
#include "angle_gl.h"
#include "d3dx9.h"

ID3DXBuffer *hlsl_compiled, *hlsl_errors = nullptr;
ID3DXConstantTable *hlsl_constants = nullptr;

extern "C" {
    void angle_init();
    void angle_init_resources(ShBuiltInResources *resources);
ShHandle angle_construct_compiler(sh::GLenum type,
                                  ShShaderSpec spec,
                                  ShShaderOutput output,
                                  const ShBuiltInResources *resources);
void angle_destruct_compiler(ShHandle handle);
bool angle_compile(const ShHandle handle,
                   const char *const shaderStrings[],
                   size_t numStrings,
                   const ShCompileOptions *compileOptions);
const char *angle_get_info_log(ShHandle handle);
const char *angle_get_object_code(ShHandle handle);
}

// yoink
ShBuiltInResources::ShBuiltInResources()
{
    memset(this, 0, sizeof(*this));
}
ShCompileOptions::ShCompileOptions()
{
    memset(this, 0, sizeof(*this));
}
void GenerateResources(ShBuiltInResources *resources)
{
    angle_init_resources(resources);

    resources->MaxVertexAttribs             = 8;
    resources->MaxVertexUniformVectors      = 128;
    resources->MaxVaryingVectors            = 8;
    resources->MaxVertexTextureImageUnits   = 0;
    resources->MaxCombinedTextureImageUnits = 8;
    resources->MaxTextureImageUnits         = 8;
    resources->MaxFragmentUniformVectors    = 16;
    resources->MaxDrawBuffers               = 1;
    resources->MaxDualSourceDrawBuffers     = 1;

    resources->OES_standard_derivatives  = 0;
    resources->OES_EGL_image_external    = 0;
    resources->EXT_geometry_shader       = 1;
    resources->ANGLE_texture_multisample = 0;
    resources->APPLE_clip_distance       = 0;
}

ShBuiltInResources resources;
ShHandle glsl_compiler = nullptr;
ShCompileOptions angle_options = {};

GMREAL __gm82angle_init() {
    angle_options.objectCode = true;
    angle_init();
    GenerateResources(&resources);
    return 0;
}

GMREAL __gm82angle_glsl_translate(const char* glsl) {
    if (glsl_compiler != nullptr) {
        angle_destruct_compiler(glsl_compiler);
    }
    glsl_compiler = angle_construct_compiler(GL_FRAGMENT_SHADER, SH_GLES2_SPEC, SH_HLSL_3_0_OUTPUT, &resources);
    return angle_compile(glsl_compiler, &glsl, 1, &angle_options);
}

GMSTR __gm82angle_glsl_get_code() {
    return angle_get_object_code(glsl_compiler);
}

GMSTR __gm82angle_glsl_get_info() {
    return angle_get_info_log(glsl_compiler);
}

GMREAL __gm82angle_hlsl_compile(const char* hlsl, const char *profile) {
    size_t hlsl_len = strlen(hlsl);
    return D3DXCompileShader(hlsl, hlsl_len, nullptr, nullptr, "main",
                      profile, 0, &hlsl_compiled, &hlsl_errors, &hlsl_constants) == D3D_OK;
}

GMREAL __gm82angle_hlsl_get_buffer(double pointer) {
    if (hlsl_compiled == nullptr) return -1;
    memcpy((void*)(int)pointer, hlsl_compiled->GetBufferPointer(), hlsl_compiled->GetBufferSize());
    return 0;
}

GMREAL __gm82angle_hlsl_get_size() {
    if (hlsl_compiled == nullptr) return -1;
    return hlsl_compiled->GetBufferSize();
}

GMSTR __gm82angle_hlsl_get_errors() {
    if (hlsl_errors == nullptr) return "";
    return (const char*)hlsl_errors->GetBufferPointer();
}

GMREAL __gm82angle_hlsl_get_uniform_count() {
    D3DXCONSTANTTABLE_DESC desc;
    hlsl_constants->GetDesc(&desc);
    return desc.Constants;
}

GMREAL __gm82angle_hlsl_get_uniform_handle(double id, double parent) {
    return (int)hlsl_constants->GetConstant((char*)(int)parent, int(id));
}

#define GET_UNI_PROP(ty, lo, hi) \
    ty __gm82angle_hlsl_get_uniform_ ## lo(double id, double parent) { \
        D3DXCONSTANT_DESC desc; \
        UINT count = 1;              \
        hlsl_constants->GetConstantDesc(hlsl_constants->GetConstant((char*)(int)parent, int(id)), &desc, &count); \
        return desc.hi; \
    }

GET_UNI_PROP(GMSTR, name, Name)
GET_UNI_PROP(GMREAL, class, Class)
GET_UNI_PROP(GMREAL, type, Type)
GET_UNI_PROP(GMREAL, register_index, RegisterIndex)
GET_UNI_PROP(GMREAL, register_count, RegisterCount)
GET_UNI_PROP(GMREAL, rows, Rows)
GET_UNI_PROP(GMREAL, columns, Columns)
GET_UNI_PROP(GMREAL, members, StructMembers)
