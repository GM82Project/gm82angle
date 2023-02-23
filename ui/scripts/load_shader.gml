if (argument_count) fn=argument[0]
else fn=get_open_filename("Shader source code|*.hlsl;*.glsl;*.txt","")

textfield_set("path",fn)

FILENAME=fn
TEXT_IN=file_text_read_all(fn)

room_caption=filename_name(fn)+" - "+version

textarea_set("source",TEXT_IN)
