var in,out;

in=argument0
out=""

i=1 repeat (string_length(in)) {
    c=string_char_at(in,i)
    if (string_pos(c,alphanum)) out+=c
i+=1}

if (string_pos(string_char_at(out,1),"0123456789")) out="_"+out

return out
