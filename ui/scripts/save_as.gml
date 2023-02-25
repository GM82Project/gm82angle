var ext;

ext=".bin"

if (TYPE=="vs2") ext=".vs2"
if (TYPE=="ps2") ext=".ps2"
if (TYPE=="vs3") ext=".vs3"
if (TYPE=="ps3") ext=".ps3"

OUTPUT=get_save_filename("Compiled HLSL shader|*.vs2;*.vs3;*.ps2;*.ps3",filename_change_ext(FILENAME,ext))

if (OUTPUT="") OUTPUT=filename_remove_ext(FILENAME)+ext

dir=OUTPUT

if (string_length(dir)>50) dir=string_copy(dir,1,25)+"..."+string_copy(dir,string_length(dir)-24,25)

COMPILE_LABEL="Output set: "+dir
COMPILE_LABEL_COLOR=$ffffff
