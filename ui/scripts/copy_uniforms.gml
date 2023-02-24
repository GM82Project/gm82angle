var vertex,count,str,i,type,addressed,address;

if (!COMPILED) exit

addressed=0

func="pixel"
if (TYPE=="vs2" || TYPE=="vs3") func="vertex"

str=""

count=hlsl_get_uniform_count()
i=0 repeat (count) {
    name=qt+hlsl_get_uniform_name(i,0)+qt
    size=hlsl_get_uniform_register_count(i,0)
    if (size>1) {
        if (hlsl_get_uniform_rows(i,0)==4 && hlsl_get_uniform_columns(i,0)==4) {
            str+="shader_"+func+"_uniform_matrix("+name+",mtx_...)"+crlf
        } else {
            addressed=1
            address=0
            str+="baseAddress=shader_"+func+"_uniform_get_address("+name+")"+crlf
            if ((string_pos("color",string_lower(name)) || string_pos("colour",string_lower(name))) && hlsl_get_uniform_columns(i,0)==4) {
                repeat (size) {
                    str+="shader_"+func+"_uniform_color(baseAddress+"+string(address)+",color,alpha)"+crlf
                    address+=4
                }
            } else {
                repeat (size) {
                    args=string_repeat(",value",hlsl_get_uniform_columns(i,0))
                    switch (hlsl_get_uniform_type(i,0)) {
                        case 1: str+="shader_"+func+"_uniform_b(baseAddress+"+string(address)+args+")"+crlf break
                        case 2: str+="shader_"+func+"_uniform_i(baseAddress+"+string(address)+args+")"+crlf break
                        case 3: str+="shader_"+func+"_uniform_f(baseAddress+"+string(address)+args+")"+crlf break
                    }
                    address+=4
                }
            }
        }
    } else {
        if ((string_pos("color",string_lower(name)) || string_pos("colour",string_lower(name))) && hlsl_get_uniform_columns(i,0)==4) {
            str+="shader_"+func+"_uniform_color("+name+",color,alpha)"+crlf
        } else {
            switch (hlsl_get_uniform_type(i,0)) {
                case 1: str+="shader_"+func+"_uniform_b("+name+",value)"+crlf break
                case 2: str+="shader_"+func+"_uniform_i("+name+",value)"+crlf break
                case 3: str+="shader_"+func+"_uniform_f("+name+",value)"+crlf break
                case 12: str+="texture_stage_set("+string(hlsl_get_uniform_register_index(i,0))+",texture)"+crlf break
            }
        }
    }
i+=1}

if (addressed) str="//"+filename_remove_ext(filename_name(FILENAME))+crlf+"var baseAddress;"+crlf+str
else str="//"+filename_remove_ext(filename_name(FILENAME))+crlf+str

clipboard_set_text(str)

COMPILE_LABEL="Shader uniforms copied to clipboard."
COMPILE_LABEL_COLOR=$ffffff
