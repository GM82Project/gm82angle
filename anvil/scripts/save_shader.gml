if (!COMPILED || CLIPBOARD) exit

b=buffer_create()
buffer_set_size(b,hlsl_get_size())
hlsl_get_buffer(buffer_get_address(b))

buffer_set_pos(b,0)

sig=buffer_read_u32(b)&$ffffff00
if (sig==$FFFE0300) ext=".vs3"
else if (sig==$FFFE0200) ext=".vs2"
else if (sig==$FFFF0300) ext=".ps3"
else if (sig==$FFFF0200) ext=".ps2"
else {
    show_message("Something wrong! show this to renex:#"+string_hex(sig))
    buffer_destroy(b)
    exit
}

buffer_save(b,filename_remove_ext(OUTPUT)+ext)

buffer_destroy(b)
