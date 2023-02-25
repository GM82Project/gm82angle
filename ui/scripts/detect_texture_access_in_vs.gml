p=string_pos("tex2D",argument0)

if (string_pos(string_char_at(argument0,p-1),alphanum)) return 0
i=p+5 repeat (string_length(argument0)-i) {
    c=string_char_at(argument0,i)
    if (string_pos(c,alphanum)) return 0
    if (string_pos(c," (")) return 1
}

return 0
