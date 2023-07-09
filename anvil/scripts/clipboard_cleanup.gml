var str;

str=argument0

if (string_pos(")"+crlf+crlf+"/*",str)>string_pos("return shader_",str)) {
    //we're dealing with an anvil packed shader so get the block comment only
    p=string_pos("/*",str)+2
    str=string_copy(str,p,string_pos("*/",str)-p)
}

//remove excess indentation
while (string_count(crlf+"    ",str)>=string_count(crlf,str)-1-string_count(crlf+crlf,str))
    str=string_replace_all(str,crlf+"    ",crlf)

//remove leading and trailing line breaks
while (string_starts_with(str,crlf)) str=string_delete(str,1,2)
while (string_ends_with(str,crlf)) str=string_copy(str,1,string_length(str)-2)

return str
