i=instance_create(8,8,Button)
i.w=240
i.action="load"
i.text="Load shader source"

i=instance_create(8,72,Button)
i.w=240
i.action="open"
i.text="Open in editor"

i=instance_create(248,72,Button)
i.w=240
i.action="open input"
i.text="Show in folder"


i=instance_create(8,40,TextField)
i.w=480
i.action="path"

i=instance_create(528,8,Button)
i.w=80
i.action="vs2"
i.text="VS 2.0"
i=instance_create(608,8,Button)
i.w=80
i.action="ps2"
i.text="PS 2.0"
i=instance_create(528,40,Button)
i.w=80
i.action="vs2"
i.text="VS 3.0"
i=instance_create(608,40,Button)
i.w=80
i.action="ps2"
i.text="PS 3.0"

i=instance_create(528,72,Button)
i.w=160
i.action="shadertoy"
i.text="Shadertoy"


i=instance_create(0,112,TextField)
i.w=WIDTH-32
i.h=208
i.action="source"

i=instance_create(WIDTH-32,112,Button)
i.action="source up"
i.sprite=0

i=instance_create(WIDTH-32,112+32,Button)
i.action="source scroll"

i=instance_create(WIDTH-32,320-32,Button)
i.action="source down"
i.sprite=1


i=instance_create(8,328,Button)
i.w=240
i.action="compile"
i.text="Compile"


i=instance_create(0,368,TextField)
i.w=WIDTH-32
i.h=208
i.action="output"

i=instance_create(WIDTH-32,368,Button)
i.action="output up"
i.sprite=0

i=instance_create(WIDTH-32,368+32,Button)
i.action="output scroll"

i=instance_create(WIDTH-32,576-32,Button)
i.action="output down"
i.sprite=1


i=instance_create(8,584,Button)
i.w=224
i.action="copy uniform"
i.text="Copy uniform code"

i=instance_create(232,584,Button)
i.w=224
i.action="copy base64"
i.text="Copy packed shader"

i=instance_create(464,584,Button)
i.w=224
i.action="open output"
i.text="Show in folder"



//initialize all buttons
with (Button) event_user(0)
