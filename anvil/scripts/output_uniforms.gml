var count,str,i,type;

count=hlsl_get_uniform_count()
str="Profile: "+profile+"#Binary size: "+string(hlsl_get_size()/1024)+"KB#"
if (count==0) str+="No uniforms"
else str+="Uniform count: "+string(count)+"##"
i=0 repeat (count) {
    switch (hlsl_get_uniform_type(i,0)) {
        case 0: type="unsupported type" break
        case 1: type="bool" break
        case 2: type="int" break
        case 3: type="float" break
        case 4: type="unsupported type" break
        case 5: type="unsupported type" break
        case 6: type="unsupported type" break
        case 7: type="unsupported type" break
        case 8: type="unsupported type" break
        case 9: type="unsupported type" break
        case 10: type="unsupported type" break
        case 11: type="unsupported type" break
        case 12: type="sampler" break
        case 13: type="unsupported type" break
        case 14: type="unsupported type" break
        case 15: type="unsupported type" break
        case 16: type="unsupported type" break
        case 17: type="unsupported type" break
        case 18: type="unsupported type" break
        case 19: type="unsupported type" break
    }
    if (type=="float" && hlsl_get_uniform_rows(i,0)==4 && hlsl_get_uniform_columns(i,0)==4) {
        type="matrix"
        size=1
    } else size=hlsl_get_uniform_register_count(i,0)
    if (size>1) str+=hlsl_get_uniform_name(i,0)+"["+string(size)+"]: "+type+"#"
    else str+=hlsl_get_uniform_name(i,0)+": "+type+"#"
i+=1}

return str

/*
case 0: type="VOID" break
        case 1: type="BOOL" break
        case 2: type="INT" break
        case 3: type="FLOAT" break
        case 4: type="STRING" break
        case 5: type="TEXTURE" break
        case 6: type="TEXTURE1D" break
        case 7: type="TEXTURE2D" break
        case 8: type="TEXTURE3D" break
        case 9: type="TEXTURECUBE" break
        case 10: type="SAMPLER" break
        case 11: type="SAMPLER1D" break
        case 12: type="SAMPLER2D" break
        case 13: type="SAMPLER3D" break
        case 14: type="SAMPLERCUBE" break
        case 15: type="PIXELSHADER" break
        case 16: type="VERTEXSHADER" break
        case 17: type="PIXELFRAGMENT" break
        case 18: type="VERTEXFRAGMENT" break
        case 19: type="UNSUPPORTED" break
